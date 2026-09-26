import 'dart:math';
import 'dart:typed_data';

// 29
// ms
// Beats
// 100.00%

class Solution {
  double mincostToHireWorkers(List<int> quality, List<int> wage, int k) {
    if (k == 1) return wage.fold(wage[0], (s, e) => min(s, e)).toDouble();

    final len = quality.length;
    final rate = List.generate(len, (i) => wage[i] / quality[i], growable: false);
    final list = List.generate(len, (i) => i)..sort((a, b) => rate[b].compareTo(rate[a]));
    final end_sum = len - k + 1;
    late int qua;
    var sum = 0;
    final heap = IntMaxHeap.fromList(
      list.sublist(end_sum, len).map((i) {
        qua = quality[i];
        sum += qua;
        return qua;
      }).toList(),
      capacity: k - 1,
    );
    final sum_quality = Uint32List(len);
    sum_quality[end_sum] = sum;

    for (var j = end_sum - 1; j > 0; j--) {
      qua = quality[list[j]];
      sum = sum_quality[j] = sum + qua - heap.addBounded(qua, k - 1)!;
    }

    var cost = rate[list[0]] * (quality[list[0]] + sum_quality[1]);
    // print('cost $cost');

    for (var i = 1; i < len - k + 1; i++) {
      // print('cost ${rate[list[i]] * (quality[list[i]] + sum_quality[i + 1])}');

      cost = min(cost, rate[list[i]] * (quality[list[i]] + sum_quality[i + 1]));
    }

    return cost;
  }
}

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

  /// Keeps the [k] smallest values seen so far, the heap acting as the barrier:
  /// the largest of the kept ones sits on top, waiting to be beaten.
  ///
  /// Below [k] items it is plain [add]. Once full, [value] takes the top's
  /// place when it is smaller, in one sift-down — cheaper than [removeFirst]
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
    if (value >= top) return value;

    final n = _length;
    var i = 0;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && _buf[child + 1] > _buf[child]) child++;
      final c = _buf[child];
      if (c <= value) break;
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

void main(List<String> args) {
  print(Solution().mincostToHireWorkers([3, 1, 10, 10, 1], [4, 8, 2, 2, 7], 3));
}
