import 'package:collection/collection.dart';

// 265
// ms
// Beats
// 100.00%

class Solution {
  int minimumTime(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;
    final visted = List.generate(r, (_) => List.filled(c, -1));
    final heap = HeapPriorityQueue<(int, int, int)>((a, b) => a.$3.compareTo(b.$3));
    if (grid[0][1] <= 1) {
      heap.add((0, 1, 1));
      visted[0][1] = 1;
    }
    if (grid[1][0] <= 1) {
      heap.add((1, 0, 1));
      visted[1][0] = 1;
    }

    if (heap.isEmpty) return -1;

    int add_2_heap(int i, int j, int parent_cost) {
      if (i == -1 || i == r || j == -1 || j == c) return -1;
      var next_cost = grid[i][j];

      final diff = next_cost - parent_cost;
      if (diff > 1) {
        if (diff.isEven) next_cost++;
      } else {
        next_cost = parent_cost + 1;
      }
      if (i == r - 1 && j == c - 1) return next_cost;
      final cached = visted[i][j];
      if (cached != -1 && cached <= next_cost) return -1;
      visted[i][j] = next_cost;
      heap.add((i, j, next_cost));
      return -1;
    }

    while (heap.isNotEmpty) {
      final (i, j, cost) = heap.removeFirst();

      // if (i == r - 1 && j == c - 1) return cost;

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

void main(List<String> args) {
  print(
    Solution().minimumTime([
      [0, 1, 3, 2],
      [5, 1, 2, 5],
      [4, 3, 8, 6],
    ]),
  );
}
