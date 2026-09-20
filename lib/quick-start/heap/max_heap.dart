/// `MinHeap<T>` with every comparison reversed: the largest element is on top.
///
/// A separate class rather than a flag on `MinHeap`, so that neither pays an
/// extra branch per comparison — the same split as `IntMinHeap` / `IntMaxHeap`.
///
/// The top is the element that [compare] ranks highest: `compare(a, b) > 0`
/// means `a` comes out before `b`. Without a comparator the order is natural,
/// so [T] must implement `Comparable` (`int`, `double`, `String`, …); a type
/// that does not throws on the first comparison. A comparator is passed in its
/// normal ascending form and used as is — `MaxHeap<(int, int)>((a, b) =>
/// a.$1.compareTo(b.$1))` pops the largest `$1` first, no manual flipping.
///
/// For plain `int` keys use `IntMaxHeap` (`int_max_heap.dart`).
class MaxHeap<T> {
  final List<T> _items = [];
  final int Function(T a, T b) compare;

  /// Largest first. Without [compare], by natural order.
  MaxHeap([int Function(T a, T b)? compare])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b));

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// Without [compare] the order is natural largest-first, as in [MaxHeap].
  MaxHeap.fromList(Iterable<T> items, [int Function(T a, T b)? compare])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)) {
    _items.addAll(items);
    for (var i = (_items.length >> 1) - 1; i >= 0; i--) {
      _siftDown(i);
    }
  }

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;

  int get length => _items.length;

  /// The largest element, without removing it.
  T get first => _items[0];

  void add(T value) {
    _items.add(value);

    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      if (compare(value, _items[parent]) <= 0) break;
      _items[i] = _items[parent];
      i = parent;
    }
    _items[i] = value;
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
        if (child + 1 < n && compare(_items[child + 1], _items[child]) > 0) child++;
        if (compare(_items[child], last) <= 0) break;
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
      if (child + 1 < n && compare(_items[child + 1], _items[child]) > 0) child++;
      if (compare(_items[child], value) <= 0) break;
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
