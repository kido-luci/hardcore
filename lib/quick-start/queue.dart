import 'dart:typed_data';

/// FIFO on a fixed-capacity ring buffer, for any element type.
///
/// Drop-in for `dart:collection`'s `Queue<T>` in the usual BFS shape — `add`,
/// `removeFirst`, `isNotEmpty` — and measured faster than it, because the whole
/// buffer is allocated once up front. `Queue` starts small and grows by
/// doubling and copying, and a BFS that enqueues every node pays for that
/// several times over.
///
/// [capacity] must be at least the greatest number of items alive at one time.
/// For a traversal that marks each node as it is enqueued, every node is
/// enqueued at most once, so the node count is enough — and with that bound the
/// buffer never actually wraps.
///
/// For `int` elements use [IntQueue] below instead. Not because generics box —
/// an int that fits in 63 bits sits directly in the slot either way — but
/// because a `List<T?>` slot is 8 bytes and carries a write barrier, and every
/// removal pays a runtime cast back to `T`.
///
/// [clear] does not null out the slots, so a cleared queue keeps its elements
/// reachable until they are overwritten. Irrelevant inside a single solve; do
/// not hold one of these alive as a long-lived field.
class RingQueue<T> {
  final List<T?> _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  RingQueue(int capacity)
    : _capacity = capacity,
      _buf = List<T?>.filled(capacity, null);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The front of the queue, without removing it.
  T get first => _buf[_head] as T;

  void add(T value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  T removeFirst() {
    final value = _buf[_head] as T;

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
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

/// FIFO of ints on a fixed-capacity ring buffer.
///
/// Same structure as [RingQueue], specialised to `int`. What that buys is not
/// an escape from boxing — the Dart VM already stores small ints inline, and a
/// `List<int>` allocates nothing per element. It buys 4-byte slots instead of
/// 8-byte ones, no write barrier, and no cast on removal. Small as each of
/// those is, together they are why `RingQueue<int>` loses to this class and to
/// `dart:collection`'s `Queue<int>` alike.
///
/// Do not change [_buf] to `List<int>` in order to pick a narrower element type
/// per instance. Three buffer types then reach this code and every access
/// becomes a polymorphic call — measured slower than `Queue<int>`, which is the
/// whole thing this class exists to beat. One concrete type is the point.
/// `Int32List` covers -2^31 .. 2^31 - 1, which is every LeetCode int
/// constraint; 4 bytes a slot is not worth trading for.
class IntQueue {
  final Int32List _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  IntQueue(int capacity)
    : _capacity = capacity,
      _buf = Int32List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The front of the queue, without removing it.
  int get first => _buf[_head];

  void add(int value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  int removeFirst() {
    final value = _buf[_head];

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
  }

  void clear() {
    _head = 0;
    _length = 0;
  }
}
