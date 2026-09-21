// 13
// ms
// Beats
// 100.00%

class Solution {
  List<int> maxSubsequence(List<int> nums, int k) {
    final heap = MinHeap<int>((a, b) => nums[a].compareTo(nums[b]));

    for (var i = 0; i < nums.length; i++) heap.addBounded(i, k);

    return (heap.toList()..sort()).map((i) => nums[i]).toList();
  }
}

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
/// Same API shape as `PriorityQueue` and `RingQueue` — `add`, `first`,
/// `removeFirst` — so swapping between them is a one-line change. The backing
/// list grows as needed, so there is no capacity to guess.
///
/// For plain `int` keys use `IntMinHeap` (`int_min_heap.dart`).
class MinHeap<T> {
  final List<T> _items = [];
  final int Function(T a, T b) compare;

  /// Smallest first. Without [compare], by natural order.
  MinHeap([int Function(T a, T b)? compare])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b));

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// Without [compare] the order is natural smallest-first, as in [MinHeap].
  MinHeap.fromList(Iterable<T> items, [int Function(T a, T b)? compare])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)) {
    _items.addAll(items);
    for (var i = (_items.length >> 1) - 1; i >= 0; i--) {
      _siftDown(i);
    }
  }

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;

  int get length => _items.length;

  /// The smallest element, without removing it.
  T get first => _items[0];

  void add(T value) {
    _items.add(value);

    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      if (compare(value, _items[parent]) >= 0) break;
      _items[i] = _items[parent];
      i = parent;
    }
    _items[i] = value;
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
  /// [k] is at least 1.
  void addBounded(T value, int k) {
    if (_items.length < k) {
      add(value);
      return;
    }
    if (compare(value, _items[0]) <= 0) return;

    _items[0] = value;
    _siftDown(0);
  }

  T removeFirst() {
    final top = _items[0];
    final last = _items.removeLast();

    if (_items.isNotEmpty) {
      final n = _items.length;
      var i = 0;
      while (true) {
        var child = 2 * i + 1;
        if (child >= n) break;
        if (child + 1 < n && compare(_items[child + 1], _items[child]) < 0) child++;
        if (compare(_items[child], last) >= 0) break;
        _items[i] = _items[child];
        i = child;
      }
      _items[i] = last;
    }

    return top;
  }

  void clear() => _items.clear();

  void _siftDown(int i) {
    final value = _items[i];
    final n = _items.length;
    while (true) {
      var child = 2 * i + 1;
      if (child >= n) break;
      if (child + 1 < n && compare(_items[child + 1], _items[child]) < 0) child++;
      if (compare(_items[child], value) >= 0) break;
      _items[i] = _items[child];
      i = child;
    }
    _items[i] = value;
  }

  /// Every element, in heap order — not sorted. Changing it does not change
  /// the heap.
  List<T> toList() => List<T>.of(_items);

  @override
  String toString() => _items.toString();
}
