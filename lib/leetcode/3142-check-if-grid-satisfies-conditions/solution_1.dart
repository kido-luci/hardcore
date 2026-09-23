// 0
// ms
// Beats
// 100.00%

class Solution {
  bool satisfiesConditions(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;

    for (var j = 0; j < c - 1; j++) {
      if (grid[0][j] == grid[0][j + 1]) return false;
    }

    for (var j = 0; j < c; j++) {
      for (var i = 0; i < r - 1; i++) {
        if (grid[i][j] != grid[i + 1][j]) return false;
      }
    }

    return true;
  }
}
