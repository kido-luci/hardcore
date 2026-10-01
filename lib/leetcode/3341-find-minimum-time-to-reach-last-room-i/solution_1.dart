import 'dart:math';

import 'package:collection/collection.dart';

// 545
// ms
// Beats
// 100.00%

class Solution {
  int minTimeToReach(List<List<int>> moveTime) {
    final r = moveTime.length;
    final c = moveTime.first.length;
    final visted = List.generate(r, (_) => List.filled(c, -1));
    final heap = HeapPriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    heap.add((0, 0, 0));
    visted[0][0] = 1;

    int add_2_heap(int i, int j, int cost) {
      if (i == -1 || i == r || j == -1 || j == c) return -1;
      cost = max(moveTime[i][j], cost) + 1;
      if (i == r - 1 && j == c - 1) return cost;
      final cached = visted[i][j];
      if (cached != -1 && cached <= cost) return -1;
      visted[i][j] = cost;
      heap.add((i, j, cost));
      return -1;
    }

    while (heap.isNotEmpty) {
      final (i, j, cost) = heap.removeFirst();

      if (cost > visted[i][j]) continue;

      var r = add_2_heap(i, j + 1, cost);
      if (r != -1) return r;
      r = add_2_heap(i + 1, j, cost);
      if (r != -1) return r;
      r = add_2_heap(i, j - 1, cost);
      if (r != -1) return r;
      r = add_2_heap(i - 1, j, cost);
      if (r != -1) return r;
    }

    return -1;
  }
}
