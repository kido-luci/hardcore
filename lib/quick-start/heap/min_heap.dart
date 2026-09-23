/// Binary min-heap for any element type.
///
/// Dart ships no heap in `dart:core` or `dart:collection`; `PriorityQueue`
/// lives in `package:collection`. This one needs no import.
///
/// The top is the element that [compare] ranks lowest: `compare(a, b) < 0`
/// means `a` comes out before `b`. Without a comparator the order is natural,
/// so [T] must implement `Comparable` (`int`, `double`, `String`, …); a type
/// that does not throws on the first comparison. For Dijkstra, a record keyed
/// on the distance does it: `MinHeap<(int, int)>((a, b) => a.$1.compareTo(b.$1))`.
///
/// `MaxHeap` (`max_heap.dart`) is this structure with every comparison
/// reversed — a separate class rather than a flag, so that neither pays an
/// extra branch per comparison.
///
/// **capacity** is the greatest number of items alive at one time, and it is a
/// hard ceiling: [add] past it throws, exactly as `IntMinHeap` and `RingStack`
/// do, because the buffer is allocated once and never grows. Pass `null` — the
/// default — for a heap that starts small and doubles as needed, which costs a
/// reallocation and a copy each time it outgrows itself.
///
/// The backing store is a `List<T?>` either way — that is what makes a capacity
/// expressible at all, since a growable `List<T>` has no way to reserve room.
/// The price is a cast back to `T` on every read, and a heap reads several
/// elements per operation, so it is paid often: measured about 10% slower than
/// the earlier `List<T>` version over 2,000,000 add-then-pop (651 ms against
/// 718 ms), in both modes. `RingStack` makes the same trade and comes out ahead
/// because it touches one slot per operation; this one does not. Pass a
/// capacity for the guarantee that nothing is ever reallocated, not for speed.
///
/// [clear] does not null out the slots, so a cleared heap keeps its elements
/// reachable until they are overwritten. Irrelevant inside a single solve; do
/// not hold one of these alive as a long-lived field.
///
/// For plain `int` keys use `IntMinHeap` (`int_min_heap.dart`).
class MinHeap<T> {
  static const _initial = 8;

  List<T?> _buf;
  final bool _fixed;
  int _length = 0;
  final int Function(T a, T b) compare;

  /// Smallest first. Without [compare], by natural order. Without [capacity],
  /// the heap grows on demand.
  MinHeap([int Function(T a, T b)? compare, int? capacity])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)),
      _fixed = capacity != null,
      _buf = List<T?>.filled(capacity ?? _initial, null);

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// Without [compare] the order is natural smallest-first, as in [MinHeap].
  /// [capacity] defaults to growing on demand; pass one to cap the heap, and it
  /// must be at least the length of [items].
  MinHeap.fromList(Iterable<T> items, [int Function(T a, T b)? compare, int? capacity])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)),
      _fixed = capacity != null,
      _buf = List<T?>.filled(capacity ?? _initial, null) {
    for (final item in items) {
      if (_length == _buf.length) _grow();
      _buf[_length++] = item;
    }
    for (var i = (_length >> 1) - 1; i >= 0; i--) {
      _siftDown(i);
    }
  }

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The room the heap was given, or `null` when it grows on demand.
  int? get capacity => _fixed ? _buf.length : null;

  /// The smallest element, without removing it.
  T get first => _buf[0] as T;

  void add(T value) {
    if (_length == _buf.length) _grow();

    var i = _length++;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      final p = _buf[parent] as T;
      if (compare(value, p) >= 0) break;
      _buf[i] = p;
      i = parent;
    }
    _buf[i] = value;
  }

  /// Keeps the [k] elements that [compare] ranks highest, the heap acting as
  /// the barrier: the lowest-ranked of the kept ones sits on top, waiting to be
  /// beaten.
  ///
  /// Below [k] items it is plain [add]. Once full, [value] takes the top's
  /// place when it outranks it, in one sift-down — cheaper than [removeFirst]
  /// plus [add], which sifts down and then straight back up. A [value] that
  /// ties with the top is dropped; keeping it would leave the same multiset.
  ///
  /// [k] is at least 1, and never above [capacity] when there is one.
  void addBounded(T value, int k) {
    if (_length < k) {
      add(value);
      return;
    }
    if (compare(value, _buf[0] as T) <= 0) return;

    _buf[0] = value;
    _siftDown(0);
  }

  T removeFirst() {
    final top = _buf[0] as T;
    final last = _buf[--_length] as T;

    if (_length != 0) {
      final n = _length;
      var i = 0;
      while (true) {
        var child = 2 * i + 1;
        if (child >= n) break;
        if (child + 1 < n && compare(_buf[child + 1] as T, _buf[child] as T) < 0) {
          child++;
        }
        if (compare(_buf[child] as T, last) >= 0) break;
        _buf[i] = _buf[child];
        i = child;
      }
      _buf[i] = last;
    }

    return top;
  }

  void clear() => _length = 0;

  /// Doubles the buffer. Throws when the heap was given a [capacity], which is
  /// a ceiling and not a hint — the same contract as `IntMinHeap`.
  void _grow() {
    if (_fixed) {
      throw StateError('MinHeap is full: capacity ${_buf.length}');
    }

    final bigger = List<T?>.filled(_buf.length * 2, null);
    bigger.setRange(0, _length, _buf);
    _buf = bigger;
  }

  void _siftDown(int i) {
    final value = _buf[i] as T;
    final n = _length;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && compare(_buf[child + 1] as T, _buf[child] as T) < 0) {
        child++;
      }
      if (compare(_buf[child] as T, value) >= 0) break;
      _buf[i] = _buf[child];
      i = child;
    }
    _buf[i] = value;
  }

  /// Every element, in heap order — not sorted. Changing it does not change
  /// the heap.
  List<T> toList() => List<T>.generate(_length, (i) => _buf[i] as T);

  @override
  String toString() => toList().toString();
}
