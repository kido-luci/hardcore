// 125
// ms
// Beats
// 100.00%

class Solution {
  int countPaths(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;

    final dp = List.generate(r, (_) => List<int?>.filled(c, null));

    int ways = 0;

    final stack = <(int, int, int)>[];

    void add_2_stack(int i, int j, int parent) {
      if (i == -1 || i == r || j == -1 || j == c) return;
      if (grid[i][j] <= parent) return;
      stack.add((i, j, parent));
    }

    int try_move(int i, int j, int parent) {
      if (i == -1 || i == r || j == -1 || j == c) return 0;
      if (grid[i][j] <= parent) return 0;
      return dp[i][j]!;
    }

    void handler() {
      while (stack.isNotEmpty) {
        final (i, j, parent) = stack.last;
        if (dp[i][j] != null && dp[i][j] != 0) {
          stack.removeLast();
          continue;
        }

        final value = grid[i][j];
        if (dp[i][j] == null) {
          dp[i][j] = 0;
          add_2_stack(i, j - 1, value);
          add_2_stack(i - 1, j, value);
          add_2_stack(i, j + 1, value);
          add_2_stack(i + 1, j, value);
        } else {
          var move =
              1 +
              try_move(i, j - 1, value) +
              try_move(i - 1, j, value) +
              try_move(i, j + 1, value) +
              try_move(i + 1, j, value);
          move %= 1000000007;

          ways += (dp[i][j] = move);
          ways %= 1000000007;
          stack.removeLast();
        }
      }
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        stack.add((i, j, -1));
        handler();
      }
    }

    return ways;
  }
}

void main(List<String> args) {
  print(
    Solution().countPaths([
      [1, 1],
      [3, 4],
    ]),
  );
}
