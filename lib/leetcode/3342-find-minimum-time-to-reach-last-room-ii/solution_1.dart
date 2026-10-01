import 'dart:math';

import 'package:collection/collection.dart';

// 89
// ms
// Beats
// 100.00%

class Solution {
  int minTimeToReach(List<List<int>> moveTime) {
    final r = moveTime.length;
    final c = moveTime.first.length;

    if (r == 1 && c == 1) return 0;

    final cost_board = List.generate(r, (i) => List.filled(c, -1));
    final heap = HeapPriorityQueue<Move>((a, b) => a.total_cost.compareTo(b.total_cost));
    heap.add(Move(0, 0, 1, 0));
    cost_board[0][0] = 0;

    int add_2_heap(int i, int j, Move parent) {
      if (i < 0 || i == r || j < 0 || j == c) return -1;
      final cost = max(moveTime[i][j], parent.total_cost) + parent.next_cost;
      final cached = cost_board[i][j];
      if (i == r - 1 && j == c - 1) return cost;
      if (cached != -1 && cached <= cost) return -1;
      cost_board[i][j] = cost;
      heap.add(Move(i, j, parent.child_cost, cost));
      return -1;
    }

    while (heap.isNotEmpty) {
      final move = heap.removeFirst();

      var r = add_2_heap(move.i, move.j + 1, move);
      if (r != -1) return r;
      r = add_2_heap(move.i + 1, move.j, move);
      if (r != -1) return r;
      r = add_2_heap(move.i, move.j - 1, move);
      if (r != -1) return r;
      r = add_2_heap(move.i - 1, move.j, move);
      if (r != -1) return r;
    }

    return -1;
  }
}

final class Move {
  final int i;
  final int j;
  final int next_cost;
  final int total_cost;
  final int child_cost;

  Move(this.i, this.j, this.next_cost, this.total_cost) : child_cost = next_cost == 1 ? 2 : 1;
}

void main(List<String> args) {
  // print(
  //   Solution().minTimeToReach([
  //     [0, 4],
  //     [4, 4],
  //   ]),
  // );

  // print(
  //   Solution().minTimeToReach([
  //     [0, 0, 0, 0],
  //     [0, 0, 0, 0],
  //   ]),
  // );
  //
  print(
    Solution().minTimeToReach([
      [0, 1],
      [1, 2],
    ]),
  );
}
