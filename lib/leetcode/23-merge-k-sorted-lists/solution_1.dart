import 'package:hardcore/model/linked_list.dart';

// 11
// ms
// Beats
// 40.00%
class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;

    final heap = MinHeap<(int, ListNode)>((a, b) => a.$1.compareTo(b.$1), lists.length);

    for (final e in lists) if (e != null) heap.add((countLen(e), e));

    if (heap.isEmpty) return null;

    while (heap.length > 1) {
      final n1 = heap.removeFirst();
      final n2 = heap.removeFirst();

      heap.add((n1.$1 + n2.$1, merge(n1.$2, n2.$2)));
    }

    return heap.first.$2;
  }

  int countLen(ListNode? n) {
    int len = 0;

    while (n != null) {
      len++;
      n = n.next;
    }

    return len;
  }

  ListNode merge(ListNode? n1, ListNode? n2) {
    // print((n1, n2));

    final head = ListNode();
    ListNode cur = head;

    while (n1 != null && n2 != null) {
      final val_1 = n1.val;
      final val_2 = n2.val;

      if (val_1 < val_2) {
        cur.next = n1;

        // int count = 0;

        while (n1!.next != null && n1.next!.val <= val_2) {
          n1 = n1.next;
          // print(++count);
        }

        cur = n1;

        final tmp = n1.next;
        n1.next = null;
        n1 = tmp;

        // print('1======');
        // print(head.next);
        // print(n1);
      } else {
        cur.next = n2;

        // int count = 0;

        while (n2!.next != null && n2.next!.val <= val_1) {
          n2 = n2.next;
          // print(++count);
        }

        cur = n2;

        final tmp = n2.next;
        n2.next = null;
        n2 = tmp;

        // print('2======');
        // print(head.next);
        // print(n2);
      }
    }

    cur.next = n1 ?? n2;

    return head.next!;
  }
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

void main(List<String> args) {
  // print(Solution().merge(ListNode.fromList([1, 2, 7]), ListNode.fromList([4, 5, 6])));
  // print(Solution().merge(ListNode.fromList([1, 4, 5]), ListNode.fromList([1, 3, 4])));
  // // print(Solution().merge(ListNode.fromList([1, 4, 5]), null));
  // // print(Solution().merge(ListNode.fromList([1]), null));
  // //
  print(
    Solution().mergeKLists(
      [
        [1, 4, 5, 6, 7, 8, 9],
        [1, 3, 4, 10],
        [2, 6],
      ].map((e) => ListNode.fromList(e)).toList(),
    ),
  );
}
