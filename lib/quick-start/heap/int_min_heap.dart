import 'dart:typed_data';

/// Binary min-heap of ints on a fixed-capacity typed buffer.
///
/// Same reasoning as `IntStack`: 4-byte slots, no write barrier, no comparator
/// call — the ordering is a plain `<`. For a max-heap use `IntMaxHeap`.
///
/// [capacity] must be at least the greatest number of items alive at one time.
class IntMinHeap {
  final Int32List _buf;
  int _length = 0;

  IntMinHeap(int capacity) : _buf = Int32List(capacity);

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// [capacity] defaults to `items.length`; pass more to [add] afterwards.
  IntMinHeap.fromList(List<int> items, {int? capacity})
    : _buf = Int32List(capacity ?? items.length) {
    _buf.setRange(0, items.length, items);
    _length = items.length;
    for (var i = (_length >> 1) - 1; i >= 0; i--) {
      final value = _buf[i];
      var j = i;
      while (true) {
        var child = 2 * j + 1;
        if (child >= _length) break;
        if (child + 1 < _length && _buf[child + 1] < _buf[child]) child++;
        final c = _buf[child];
        if (c >= value) break;
        _buf[j] = c;
        j = child;
      }
      _buf[j] = value;
    }
  }

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The smallest element, without removing it.
  int get first => _buf[0];

  void add(int value) {
    var i = _length++;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      final p = _buf[parent];
      if (value >= p) break;
      _buf[i] = p;
      i = parent;
    }
    _buf[i] = value;
  }

  /// Keeps the [k] largest values seen so far, the heap acting as the barrier:
  /// the smallest of the kept ones sits on top, waiting to be beaten.
  ///
  /// Below [k] items it is plain [add]. Once full, [value] takes the top's
  /// place when it is larger, in one sift-down — cheaper than [removeFirst]
  /// plus [add], which sifts down and then straight back up. A [value] equal to
  /// the top is dropped; keeping it would leave the same multiset.
  ///
  /// [k] is at least 1 and never above the capacity given to the constructor.
  ///
  /// Returns what left the heap: the old top when [value] replaced it, [value]
  /// itself when it was not good enough to get in, and `null` while the heap is
  /// still below [k] and nothing was dropped. A running sum of the kept values
  /// therefore updates in one line whatever happened:
  /// `sum += value - (heap.addBounded(value, k) ?? 0)`.
  int? addBounded(int value, int k) {
    if (_length < k) {
      add(value);
      return null;
    }
    final top = _buf[0];
    if (value <= top) return value;

    final n = _length;
    var i = 0;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && _buf[child + 1] < _buf[child]) child++;
      final c = _buf[child];
      if (c >= value) break;
      _buf[i] = c;
      i = child;
    }
    _buf[i] = value;

    return top;
  }

  int removeFirst() {
    final top = _buf[0];
    final last = _buf[--_length];
    final n = _length;

    var i = 0;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && _buf[child + 1] < _buf[child]) child++;
      final c = _buf[child];
      if (c >= last) break;
      _buf[i] = c;
      i = child;
    }
    if (n > 0) _buf[i] = last;

    return top;
  }

  void clear() => _length = 0;

  /// Every element, in heap order — not sorted. An `Int32List` copy, like
  /// `IntStack.toList`: fixed-length and truncating to 32 bits.
  List<int> toList() => _buf.sublist(0, _length);

  @override
  String toString() => toList().toString();
}
