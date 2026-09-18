/// Binary min-heap for any element type, ordered by [compare].
///
/// Dart ships no heap in `dart:core` or `dart:collection`; `PriorityQueue`
/// lives in `package:collection`. This one needs no import.
///
/// The top is the element that [compare] ranks lowest: `compare(a, b) < 0`
/// means `a` comes out before `b`. For natural order use [Heap.min] or
/// [Heap.max]; otherwise pass a comparator. For Dijkstra, a record keyed on the
/// distance does it: `Heap<(int, int)>((a, b) => a.$1.compareTo(b.$1))`.
///
/// Same API shape as `PriorityQueue` and `RingQueue` — `add`, `first`,
/// `removeFirst` — so swapping between them is a one-line change. The backing
/// list grows as needed, so there is no capacity to guess.
///
/// For plain `int` keys use `IntMinHeap` (`int_min_heap.dart`) or `IntMaxHeap` (`int_max_heap.dart`).
class Heap<T> {
  final List<T> _items = [];
  final int Function(T a, T b) compare;

  Heap(this.compare);

  /// Smallest first, by natural order. [T] must implement `Comparable`
  /// (`int`, `double`, `String`, …); a type that does not throws on the first
  /// comparison.
  Heap.min() : compare = ((a, b) => (a as Comparable).compareTo(b));

  /// Largest first, by natural order. Same requirement on [T] as [Heap.min].
  Heap.max() : compare = ((a, b) => (b as Comparable).compareTo(a));

  /// A heap holding every element of [items], built in O(n) by sifting down
  /// from the last parent — cheaper than [add] one at a time, which is
  /// O(n log n). [items] is copied, not taken over.
  ///
  /// Without [compare] the order is natural smallest-first, as in [Heap.min].
  Heap.fromList(Iterable<T> items, [int Function(T a, T b)? compare])
    : compare = compare ?? ((a, b) => (a as Comparable).compareTo(b)) {
    _items.addAll(items);
    for (var i = (_items.length >> 1) - 1; i >= 0; i--) {
      _siftDown(i);
    }
  }

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;

  int get length => _items.length;

  /// The top element, without removing it.
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
