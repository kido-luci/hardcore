/// Double-ended queue on a fixed-capacity ring buffer, for any element type.
///
/// `RingQueue` with both ends opened up: [addFirst] / [addLast] and
/// [removeFirst] / [removeLast], all O(1). [add] is [addLast], so a `RingQueue`
/// used in the plain FIFO shape swaps for this one without touching call sites.
///
/// What needs both ends is the **monotonic window**: a deque of indices whose
/// values stay ordered, where a new element evicts from the back every index it
/// beats (they can never win again — the newcomer is both larger and younger)
/// while the front drops indices that have slid out of the window. Each index
/// enters once and leaves once, so a sliding-window extreme costs O(n) in total
/// instead of O(n log n) through a heap.
///
/// [capacity] must be at least the greatest number of items alive at one time —
/// for a window of width k that is k. Unlike the BFS use of `RingQueue`, this
/// one really does wrap, so both ends carry the wrap arithmetic.
///
/// For `int` elements — which is what a deque of indices holds — the same
/// reasoning as `IntQueue` applies: a `List<T?>` slot is 8 bytes with a write
/// barrier, and every removal pays a runtime cast back to `T`.
///
/// [clear] does not null out the slots, so a cleared deque keeps its elements
/// reachable until they are overwritten. Irrelevant inside a single solve; do
/// not hold one of these alive as a long-lived field.
class RingDeque<T> {
  final List<T?> _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  RingDeque(int capacity) : _capacity = capacity, _buf = List<T?>.filled(capacity, null);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The backing buffer itself — no copy — at the capacity given to the
  /// constructor, not at [length], in buffer order rather than deque order (the
  /// front sits at the current head, and a wrapped deque is split across the
  /// end). Meant for the end of a solve, once nothing will add or remove again:
  /// writing to it writes to the deque.
  List<T?> get all => _buf;

  /// The front, without removing it.
  T get first => _buf[_head] as T;

  /// The back, without removing it.
  T get last {
    var i = _head + _length - 1;
    if (i >= _capacity) i -= _capacity;

    return _buf[i] as T;
  }

  /// Appends at the back. Same slot arithmetic as `RingQueue.add`.
  void addLast(T value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  /// [addLast], so the FIFO call sites of `RingQueue` keep working.
  void add(T value) => addLast(value);

  /// Pushes at the front, moving the head one slot back and wrapping to the end
  /// of the buffer when it is already at 0.
  void addFirst(T value) {
    _head = _head == 0 ? _capacity - 1 : _head - 1;

    _buf[_head] = value;
    _length++;
  }

  T removeFirst() {
    final value = _buf[_head] as T;

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
  }

  T removeLast() {
    var i = _head + _length - 1;
    if (i >= _capacity) i -= _capacity;

    _length--;

    return _buf[i] as T;
  }

  void clear() {
    _head = 0;
    _length = 0;
  }

  /// Front to back, in the same `{a, b, c}` format as `dart:collection`'s
  /// `Queue`, so the two print identically when you swap one for the other.
  @override
  String toString() {
    final sb = StringBuffer('{');

    for (var n = 0; n < _length; n++) {
      var index = _head + n;
      if (index >= _capacity) index -= _capacity;

      if (n > 0) sb.write(', ');
      sb.write(_buf[index]);
    }

    sb.write('}');

    return sb.toString();
  }
}
