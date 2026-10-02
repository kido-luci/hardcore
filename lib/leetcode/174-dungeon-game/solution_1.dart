import 'dart:math';

import 'package:collection/collection.dart';

// 22
// ms
// Beats
// 100.00%

class Solution {
  int calculateMinimumHP(List<List<int>> dungeon) {
    final r = dungeon.length;
    final c = dungeon.first.length;
    final visted = List.generate(r, (_) => List<(int, int)?>.filled(c, null));
    // i,j,start_heal,current_heal
    final heap = HeapPriorityQueue<(int, int, int, int)>((a, b) => a.$3.compareTo(b.$3));

    void add_2_queue(int i, int j, int start_heal, int current_heal) {
      if (i == -1 || i == r || j == -1 || j == c) return;
      current_heal += dungeon[i][j];
      if (current_heal <= 0) {
        start_heal += -current_heal + 1;
        current_heal = 1;
      }
      final cached = visted[i][j];
      if (cached == null) {
        visted[i][j] = (start_heal, current_heal);
      } else {
        if (cached.$1 <= start_heal && cached.$2 >= current_heal) return;
        visted[i][j] = (min(cached.$1, start_heal), max(cached.$2, current_heal));
      }

      heap.add((i, j, start_heal, current_heal));
    }

    add_2_queue(0, 0, 1, 1);

    while (heap.isNotEmpty) {
      final (i, j, start_heal, current_heal) = heap.removeFirst();
      final cached = visted[i][j];
      if (cached != null && cached.$1 < start_heal && cached.$2 > current_heal) continue;
      if (i == r - 1 && j == c - 1) return start_heal;

      add_2_queue(i, j + 1, start_heal, current_heal);
      add_2_queue(i + 1, j, start_heal, current_heal);
    }

    return -1;
  }
}
