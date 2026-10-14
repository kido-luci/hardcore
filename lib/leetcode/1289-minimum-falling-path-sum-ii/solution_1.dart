import 'package:collection/collection.dart';

// 106
// ms
// Beats
// 100.00%

class Solution {
  int minFallingPathSum(List<List<int>> grid) {
    if (grid.length == 1) return grid.first.min;

    final r = grid.length;
    final c = grid.first.length;

    for (var i = 1; i < r; i++) {
      for (var j = 0; j < c; j++) {
        int? cost;
        final val = grid[i][j];

        for (var k = 0; k < c; k++) {
          if (k == j) continue;

          final new_cost = grid[i - 1][k] + val;

          if (cost == null || new_cost < cost) cost = new_cost;
        }

        grid[i][j] = cost!;
      }
    }

    return grid.last.min;
  }
}
