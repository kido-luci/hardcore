import 'dart:math';

import 'package:collection/collection.dart';

// 21
// ms
// Beats
// 100.00%

class Solution {
  int minFallingPathSum(List<List<int>> matrix) {
    if (matrix.length == 1) return matrix.first.min;

    final r = matrix.length;
    final c = matrix.first.length;

    for (var i = 1; i < r; i++) {
      for (var j = 0; j < c; j++) {
        int? cost;
        final val = matrix[i][j];

        for (var k = max(j - 1, 0); k <= min(j + 1, c - 1); k++) {
          final new_cost = matrix[i - 1][k] + val;

          if (cost == null || new_cost < cost) cost = new_cost;
        }

        matrix[i][j] = cost!;
      }
    }

    return matrix.last.min;
  }
}
