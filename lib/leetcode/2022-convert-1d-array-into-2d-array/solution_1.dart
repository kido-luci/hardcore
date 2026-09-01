// 7
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> construct2DArray(List<int> original, int m, int n) {
    if (original.length != m * n) return [];

    final matrix = List.generate(m, (_) => List.filled(n, 0), growable: false);

    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        matrix[i][j] = original[j + (n * i)];
      }
    }

    return matrix;
  }
}
