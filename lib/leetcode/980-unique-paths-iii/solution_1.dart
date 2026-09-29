// 1 representing the starting square. There is exactly one starting square.
// 2 representing the ending square. There is exactly one ending square.
// 0 representing empty squares we can walk over.
// -1 representing obstacles that we cannot walk over.
//
// 8
// ms
// Beats
// 100.00%

class Solution {
  int uniquePathsIII(List<List<int>> grid) {
    var valid_path = 0;

    final r = grid.length;
    final c = grid.first.length;

    late (int, int) start;
    int to_move = 0;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        switch (grid[i][j]) {
          case 0:
            to_move++;
          case 1:
            start = (i, j);
        }
      }
    }

    bool try_move(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return false;

      switch (grid[i][j]) {
        case 0:
          return true;
        case 2:
          return true;
        default:
          return false;
      }
    }

    List<(int, int)> get_ways(int i, int j) {
      return <(int, int)>[
        if (try_move(i, j - 1)) (i, j - 1),
        if (try_move(i - 1, j)) (i - 1, j),
        if (try_move(i, j + 1)) (i, j + 1),
        if (try_move(i + 1, j)) (i + 1, j),
      ];
    }

    void dfs(int start_i, int start_j, int moved) {
      final ways = get_ways(start_i, start_j);

      for (final (i, j) in ways) {
        if (grid[i][j] == 2) {
          if (moved == to_move) valid_path++;
        } else {
          grid[i][j] = -1;
          dfs(i, j, moved + 1);
          grid[i][j] = 0;
        }
      }
    }

    dfs(start.$1, start.$2, 0);

    return valid_path;
  }
}

void main(List<String> args) {
  print(
    Solution().uniquePathsIII([
      [1, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 2, -1],
    ]),
  );
}
