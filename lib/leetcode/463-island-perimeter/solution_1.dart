// 4
// ms
// Beats
// 100.00%

class Solution {
  int islandPerimeter(List<List<int>> grid) {
    int p = 0;

    for (var i = 0; i < grid.length; i++) {
      //   print(grid[i]);

      for (var j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 1) {
          final l = ((j == 0) || (grid[i][j - 1] == 0)) ? 2 : 0;
          final t = ((i == 0) || (grid[i - 1][j] == 0)) ? 2 : 0;

          p += l + t;

          //   print((grid[i][j], l + t));
        }
      }
    }

    return p;
  }
}
