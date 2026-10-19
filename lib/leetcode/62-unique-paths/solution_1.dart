// 0
// ms
// Beats
// 100.00%

class Solution {
  int uniquePaths(int m, int n) {
    final matrix = List.generate(m, (_) => List.filled(n, 1));

    for (var i = 1; i < m; i++) {
      for (var j = 1; j < n; j++) {
        matrix[i][j] = matrix[i][j - 1] + matrix[i - 1][j];
      }
    }

    return matrix[m - 1][n - 1];
  }
}
