import 'dart:math';

// 12
// ms
// Beats
// 100.00%

class Solution {
  int longestIncreasingPath(List<List<int>> matrix) {
    final r = matrix.length;
    final c = matrix.first.length;

    final dp = List.generate(r, (_) => List<int?>.filled(c, null));

    int longest = 1;

    int dfs(int i, int j, int parent) {
      if (i == -1 || i == r || j == -1 || j == c) return 0;
      final value = matrix[i][j];

      // print((i, j));

      if (value <= parent) return 0;
      var move = dp[i][j];
      if (move != null) return move;
      move = 0;
      move = max(move, dfs(i, j - 1, value));
      move = max(move, dfs(i - 1, j, value));
      move = max(move, dfs(i, j + 1, value));
      move = max(move, dfs(i + 1, j, value));
      move++;
      return dp[i][j] = move;
    }

    for (var i = 0; i < r; i++) for (var j = 0; j < c; j++) longest = max(longest, dfs(i, j, -1));

    return longest;
  }
}

void main(List<String> args) {
  // print(
  //   Solution().longestIncreasingPath([
  //     [3, 4, 5],
  //     [3, 2, 6],
  //     [2, 2, 1],
  //   ]),
  // );

  print(
    Solution().longestIncreasingPath([
      [1, 2],
    ]),
  );
}
