import 'package:collection/collection.dart';

// 696
// ms
// Beats
// 100.00%

class Solution {
  int minCost(int m, int n, List<List<int>> penalty) {
    final mem = List.generate(m, (_) => List.generate(n, (_) => List<int?>.filled(2, null)));

    final heap = HeapPriorityQueue<(int, int, int, int)>((a, b) => a.$4.compareTo(b.$4));

    void add_2_queue(int i, int j, int stat, int cost, bool stay) {
      if (i == -1 || i == m || j == -1 || j == n) return;
      if (!stay) cost += (i + 1) * (j + 1);

      final cache = mem[i][j][stat];
      if (cache != null && cache <= cost) return;
      heap.add((i, j, stat, cost));
      mem[i][j][stat] = cost;
    }

    add_2_queue(0, 0, 1, 1, true);

    while (heap.isNotEmpty) {
      final (i, j, stat, cost) = heap.removeFirst();
      if (i == m - 1 && j == n - 1) return cost;

      final isOdd = stat.isOdd;
      final next_stat = isOdd ? 0 : 1;

      final p = penalty[i][j];

      add_2_queue(i, j + 1, next_stat, cost + (isOdd ? 0 : p), false);
      add_2_queue(i + 1, j, next_stat, cost + (isOdd ? 0 : p), false);
      add_2_queue(i, j - 1, next_stat, cost + (!isOdd ? 0 : p), false);
      add_2_queue(i - 1, j, next_stat, cost + (!isOdd ? 0 : p), false);
      add_2_queue(i, j, next_stat, cost + p, true);
    }

    return -1;
  }
}

void main(List<String> args) {
  print(
    Solution().minCost(2, 2, [
      [0, 7],
      [3, 2],
    ]),
  );
}
