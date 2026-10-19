// 1
// ms
// Beats
// 100.00%

class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    final m = obstacleGrid.length;
    final n = obstacleGrid.first.length;

    final dp = List.generate(m, (_) => List.filled(n, 0));

    int handler(int i, int j) {
      if (i == -1 || j == -1) return 0;
      return obstacleGrid[i][j] == 0 ? dp[i][j] : 0;
    }

    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (obstacleGrid[i][j] == 1) continue;

        dp[i][j] = i == 0 && j == 0 ? 1 : handler(i, j - 1) + handler(i - 1, j);
      }
    }

    return dp[m - 1][n - 1];
  }
}
