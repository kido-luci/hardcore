import 'dart:math';

import 'package:collection/collection.dart';

// 9
// ms
// Beats
// -%
class Solution {
  int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
    k = min(n, k + 2);
    final paths = List.generate(n, (_) => <(int, int)>[]);
    for (final e in flights) paths[e[0]].add((e[1], e[2]));
    final visted = List<(int, int)?>.filled(n, null);
    final heap = HeapPriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    heap.add((src, 1, 0));
    visted[src] = (1, 0);

    while (heap.isNotEmpty) {
      var (node, count, cost) = heap.removeFirst();

      if (node == dst) return cost;
      if (++count > k) continue;
      final cached = visted[node];
      if (cached == null) {
        visted[node] = (count, cost);
      } else {
        if (count > cached.$1 && cost > cached.$2) continue;
        visted[node] = (min(count, cached.$1), min(cost, cached.$2));
      }

      for (var (next, next_cost) in paths[node]) {
        next_cost += cost;
        final cached = visted[next];
        if (cached == null) {
          heap.add((next, count, next_cost));
        } else {
          if (cached.$1 >= count && cached.$2 >= next_cost) continue;
          heap.add((next, count, next_cost));
        }
      }
    }

    return -1;
  }
}

void main(List<String> args) {
  print(
    Solution().findCheapestPrice(
      11,
      [
        [0, 3, 3],
        [3, 4, 3],
        [4, 1, 3],
        [0, 5, 1],
        [5, 1, 100],
        [0, 6, 2],
        [6, 1, 100],
        [0, 7, 1],
        [7, 8, 1],
        [8, 9, 1],
        [9, 1, 1],
        [1, 10, 1],
        [10, 2, 1],
        [1, 2, 100],
      ],
      0,
      2,
      4,
    ),
  );
}
