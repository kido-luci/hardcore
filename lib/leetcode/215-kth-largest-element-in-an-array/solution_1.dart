import 'dart:typed_data';

// 31
// ms
// Beats
// 96.15%

class Solution {
  int findKthLargest(List<int> nums, int k) {
    final heap = IntMaxHeap.fromList(nums);

    while (k-- > 1) heap.removeFirst();

    return heap.first;
  }
}

/// `IntMinHeap` with the order reversed: the largest element is on top.
///
/// A separate class rather than a flag on `IntMinHeap`, so that neither pays an
/// extra branch on every comparison.
class IntMaxHeap {
  final Int32List _buf;
  int _length = 0;

  IntMaxHeap(int capacity) : _buf = Int32List(capacity);

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// [capacity] defaults to `items.length`; pass more to [add] afterwards.
  IntMaxHeap.fromList(List<int> items, {int? capacity})
    : _buf = Int32List(capacity ?? items.length) {
    _buf.setRange(0, items.length, items);
    _length = items.length;
    for (var i = (_length >> 1) - 1; i >= 0; i--) {
      final value = _buf[i];
      var j = i;
      while (true) {
        var child = 2 * j + 1;
        if (child >= _length) break;
        if (child + 1 < _length && _buf[child + 1] > _buf[child]) child++;
        final c = _buf[child];
        if (c <= value) break;
        _buf[j] = c;
        j = child;
      }
      _buf[j] = value;
    }
  }

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The largest element, without removing it.
  int get first => _buf[0];

  void add(int value) {
    var i = _length++;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      final p = _buf[parent];
      if (value <= p) break;
      _buf[i] = p;
      i = parent;
    }
    _buf[i] = value;
  }

  int removeFirst() {
    final top = _buf[0];
    final last = _buf[--_length];
    final n = _length;

    var i = 0;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && _buf[child + 1] > _buf[child]) child++;
      final c = _buf[child];
      if (c <= last) break;
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
