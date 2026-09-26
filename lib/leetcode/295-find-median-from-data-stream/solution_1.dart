// 74
// ms
// Beats
// 100.00%

class MedianFinder {
  MedianFinder() {}

  final max_heap = MaxHeap<int>();
  final min_heap = MinHeap<int>();

  int len = 0;

  void addNum(int num) {
    len++;

    if (len == 1) {
      max_heap.add(num);
      return;
    }

    if (len.isEven) {
      if (num >= max_heap.first) {
        min_heap.add(num);
      } else {
        min_heap.add(max_heap.removeFirst());
        max_heap.add(num);
      }
    } else {
      if (num <= min_heap.first) {
        max_heap.add(num);
      } else {
        max_heap.add(min_heap.removeFirst());
        min_heap.add(num);
      }
    }

    // print(min_heap);
    // print(max_heap);
  }

  double findMedian() {
    return len.isOdd ? max_heap.first.toDouble() : (max_heap.first + min_heap.first) / 2;
  }
}

class MaxHeap<T> {
  static const _initial = 8;

  List<T?> _buf;
  final bool _fixed;
  int _length = 0;
  final int Function(T a, T b) compare;

  /// Largest first. Without [compare], by natural order. Without [capacity],
  /// the heap grows on demand.
  MaxHeap([int Function(T a, T b)? compare, int? capacity])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)),
      _fixed = capacity != null,
      _buf = List<T?>.filled(capacity ?? _initial, null);

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// Without [compare] the order is natural largest-first, as in [MaxHeap].
  /// [capacity] defaults to growing on demand; pass one to cap the heap, and it
  /// must be at least the length of [items].
  MaxHeap.fromList(Iterable<T> items, [int Function(T a, T b)? compare, int? capacity])
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

  /// The largest element, without removing it.
  T get first => _buf[0] as T;

  void add(T value) {
    if (_length == _buf.length) _grow();

    var i = _length++;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      final p = _buf[parent] as T;
      if (compare(value, p) <= 0) break;
      _buf[i] = p;
      i = parent;
    }
    _buf[i] = value;
  }

  /// Keeps the [k] elements that [compare] ranks lowest, the heap acting as the
  /// barrier: the highest-ranked of the kept ones sits on top, waiting to be
  /// beaten.
  ///
  /// Below [k] items it is plain [add]. Once full, [value] takes the top's
  /// place when it ranks below it, in one sift-down — cheaper than
  /// [removeFirst] plus [add], which sifts down and then straight back up. A
  /// [value] that ties with the top is dropped; keeping it would leave the same
  /// multiset.
  ///
  /// [k] is at least 1, and never above [capacity] when there is one.
  ///
  /// Returns what left the heap: the old top when [value] replaced it, [value]
  /// itself when it was not good enough to get in, and `null` while the heap is
  /// still below [k] and nothing was dropped. A running sum of the kept values
  /// therefore updates in one line whatever happened:
  /// `sum += value - (heap.addBounded(value, k) ?? 0)`.
  ///
  /// For a nullable [T] the `null` return is ambiguous — it can mean either
  /// that nothing was dropped or that a dropped element was itself `null`.
  T? addBounded(T value, int k) {
    if (_length < k) {
      add(value);
      return null;
    }
    final top = _buf[0] as T;
    if (compare(value, top) >= 0) return value;

    _buf[0] = value;
    _siftDown(0);

    return top;
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
        if (child + 1 < n && compare(_buf[child + 1] as T, _buf[child] as T) > 0) {
          child++;
        }
        if (compare(_buf[child] as T, last) <= 0) break;
        _buf[i] = _buf[child];
        i = child;
      }
      _buf[i] = last;
    }

    return top;
  }

  void clear() => _length = 0;

  /// Doubles the buffer. Throws when the heap was given a [capacity], which is
  /// a ceiling and not a hint — the same contract as `IntMaxHeap`.
  void _grow() {
    if (_fixed) {
      throw StateError('MaxHeap is full: capacity ${_buf.length}');
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
      if (child + 1 < n && compare(_buf[child + 1] as T, _buf[child] as T) > 0) {
        child++;
      }
      if (compare(_buf[child] as T, value) <= 0) break;
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
  ///
  /// Returns what left the heap: the old top when [value] replaced it, [value]
  /// itself when it was not good enough to get in, and `null` while the heap is
  /// still below [k] and nothing was dropped. A running sum of the kept values
  /// therefore updates in one line whatever happened:
  /// `sum += value - (heap.addBounded(value, k) ?? 0)`.
  ///
  /// For a nullable [T] the `null` return is ambiguous — it can mean either
  /// that nothing was dropped or that a dropped element was itself `null`.
  T? addBounded(T value, int k) {
    if (_length < k) {
      add(value);
      return null;
    }
    final top = _buf[0] as T;
    if (compare(value, top) <= 0) return value;

    _buf[0] = value;
    _siftDown(0);

    return top;
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

void main(List<String> args) {
  final s = MedianFinder();
  s.addNum(1);
  print(s.findMedian());
  s.addNum(2);
  print(s.findMedian());
  s.addNum(3);
  print(s.findMedian());
  s.addNum(4);
  print(s.findMedian());
}
