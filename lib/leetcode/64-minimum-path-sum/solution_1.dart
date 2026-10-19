import 'dart:math';

// 4
// ms
// Beats
// 33.33%
class Solution {
  int minPathSum(List<List<int>> grid) {
    final m = grid.length;
    final n = grid.first.length;

    // for (final e in grid) print(e);
    for (var i = 1; i < m; i++) {
      grid[i][0] += grid[i - 1][0];
    }
    for (var j = 1; j < n; j++) {
      grid[0][j] += grid[0][j - 1];
    }

    for (var i = 1; i < m; i++) {
      for (var j = 1; j < n; j++) {
        grid[i][j] += min(grid[i][j - 1], grid[i - 1][j]);
      }
    }

    // for (final e in grid) print(e);

    return grid[m - 1][n - 1];
  }
}

void main(List<String> args) {
  print(
    Solution().minPathSum([
      [1, 3, 1],
      [1, 5, 1],
      [4, 2, 1],
    ]),
  );
}
