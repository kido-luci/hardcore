import 'dart:typed_data';

// 37
// ms
// Beats
// 100.00%

class Solution {
  List<double> medianSlidingWindow(List<int> nums, int k) {
    if (k == 1) return List.generate(nums.length, (i) => nums[i].toDouble());
    // print('input: $nums, $k');

    final is_odd = k.isOdd;

    final half = k ~/ 2;

    final max_heap = IntMaxHeap(nums.length);
    final min_heap = IntMinHeap(nums.length);

    final l_size = is_odd ? half + 1 : half;
    final r_size = half;

    // print(('l_size: $l_size', 'r_size: $r_size'));

    for (var i = 0; i < l_size; i++) max_heap.add(nums[i]);
    for (var j = l_size; j < k; j++)
      min_heap.add(nums[j] >= max_heap.first ? nums[j] : max_heap.addBounded(nums[j], half)!);

    final len = nums.length - k + 1;
    final result = List.filled(len, 0.0)
      ..[0] = is_odd ? max_heap.first.toDouble() : (max_heap.first + min_heap.first) / 2;

    int l_remain = l_size;
    int r_remain = r_size;
    int l_removed = 0;
    int r_removed = 0;

    final removed = <int, int>{};

    void remove(int val) {
      // print('remove: $val');

      removed.update(val, (count) => count + 1, ifAbsent: () => 1);

      if (val <= max_heap.first) {
        l_remain--;
        l_removed++;
      } else {
        r_remain--;
        r_removed++;
      }

      // print('removed: left: $l_removed, right: $r_removed');
    }

    void add(int val) {
      // print('add: $val');

      if (val <= max_heap.first) {
        max_heap.add(val);
        l_remain++;
      } else {
        min_heap.add(val);
        r_remain++;
      }

      // print('remain: left: $l_remain, right: $r_remain');
    }

    void cleanup_left() {
      var top = max_heap.first;
      var count = removed[top] ?? 0;

      while (l_removed > 0 && count > 0) {
        while (count > 0 && l_removed > 0) {
          count--;
          l_removed--;

          max_heap.removeFirst();
        }

        count == 0 ? removed.remove(top) : removed[top] = count;

        if (l_removed > 0) {
          top = max_heap.first;
          count = removed[top] ?? 0;
        }
      }
    }

    void cleanup_right() {
      var top = min_heap.first;
      var count = removed[top] ?? 0;

      while (r_removed > 0 && count > 0) {
        while (count > 0 && r_removed > 0) {
          count--;
          r_removed--;

          min_heap.removeFirst();
        }

        count == 0 ? removed.remove(top) : removed[top] = count;

        if (r_removed > 0) {
          top = min_heap.first;
          count = removed[top] ?? 0;
        }
      }
    }

    void balance() {
      // print('l_remain: $l_remain');
      // print('r_remain: $r_remain');

      if (l_remain < l_size) {
        l_remain++;
        r_remain--;
        max_heap.add(min_heap.removeFirst());
        cleanup_right();
      } else if (r_remain < r_size) {
        r_remain++;
        l_remain--;
        min_heap.add(max_heap.removeFirst());
        cleanup_left();
      }
    }

    // print('---------');
    // print(('#0', nums.sublist(0, k), max_heap.first, max_heap, min_heap));

    for (var i = 1; i < len; i++) {
      // print('---------');

      remove(nums[i - 1]);
      cleanup_left();
      cleanup_right();
      add(nums[k + i - 1]);
      balance();

      // print(('#$i', nums.sublist(i, k + i), max_heap.first, max_heap, min_heap));

      result[i] = is_odd ? max_heap.first.toDouble() : (max_heap.first + min_heap.first) / 2;
    }

    // print('---------');

    return result;
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

void main(List<String> args) {
  print(Solution().medianSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 4));
  print(Solution().medianSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 2));
  // print(Solution().medianSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
  // print(
  //   Solution().medianSlidingWindow([
  //     1, 2, 3, 4,
  //     // 2,
  //     // 3, 1,
  //     // , 4, 2
  //   ], 3),
  // );
}
