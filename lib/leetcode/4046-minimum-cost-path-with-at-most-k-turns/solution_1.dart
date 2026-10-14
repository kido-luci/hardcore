import 'dart:math';

import 'package:collection/collection.dart';

// 173
// ms
// Beats
// 100.00%

class Solution {
  int minCost(List<List<int>> grid, int k) {
    final r = grid.length;
    final c = grid.first.length;

    const start = 0;
    const left = 1;
    const top = 2;
    const right = 3;
    const bottom = 4;

    final queue = HeapPriorityQueue<(int, int, int, int, int)>((a, b) => a.$5.compareTo(b.$5));

    // (turn, moved)
    final mem = List.generate(r, (_) => List.generate(c, (_) => List<(int, int)?>.filled(5, null)));

    int? add_2_queue(int i, int j, int turn, int parent_direct, int direct, int moved) {
      if (i == -1 || i == r || j == -1 || j == c) return null;
      if (parent_direct != start && parent_direct != direct && (++turn > k)) return null;
      final cache = mem[i][j][direct];
      moved += grid[i][j];
      // print((i, j, grid[i][j], moved));

      if (cache != null && turn >= cache.$1 && moved >= cache.$2) return null;
      if (i == r - 1 && j == c - 1) return moved;

      mem[i][j][direct] = cache == null
          ? (turn, moved)
          : (min(turn, cache.$1), min(moved, cache.$2));
      queue.add((i, j, turn, direct, moved));

      return null;
    }

    final first = add_2_queue(0, 0, 0, start, start, 0);
    if (first != null) return first;

    while (queue.isNotEmpty) {
      final (i, j, turn, direct, moved) = queue.removeFirst();

      final next =
          add_2_queue(i, j - 1, turn, direct, left, moved) ??
          add_2_queue(i - 1, j, turn, direct, top, moved) ??
          add_2_queue(i, j + 1, turn, direct, right, moved) ??
          add_2_queue(i + 1, j, turn, direct, bottom, moved);

      if (next != null) return next;
    }

    return -1;
  }
}

void main(List<String> args) {
  print(
    Solution().minCost([
      [4, 1, 9],
      [3, 2, 5],
      [4, 8, 6],
    ], 2),
  );
}
