import 'dart:math';
import 'dart:typed_data';

// 30
// ms
// Beats
// 100.00%

class Solution {
  int maximalSquare(List<List<String>> matrix) {
    int area = 0;

    final r = matrix.length;
    final c = matrix.first.length;

    final edges = List.generate(r, (_) => Uint16List(c));

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (matrix[i][j] == '0') continue;
        if (i == 0 || j == 0) {
          edges[i][j] = 1;
          if (area == 0) area = 1;
          continue;
        }

        final edge = edges[i][j] =
            1 + (min(min(edges[i][j - 1], edges[i - 1][j]), edges[i - 1][j - 1]));

        area = max(area, edge * edge);
      }
    }

    return area;
  }
}
