import 'dart:typed_data';

// 288
// ms
// Beats
// 36.36%
class Solution {
  bool exist(List<List<String>> board, String word) {
    final r = board.length;
    final c = board.first.length;

    final word_len = word.length;
    final visted = List.generate(r, (_) => Uint8List(c));

    bool check(int i, int j, int find) {
      if (i < 0 || i == r || j < 0 || j == c || visted[i][j] == 1) return false;

      return board[i][j].codeUnits[0] == word.codeUnits[find];
    }

    int find = 0;

    List<(int, int)> find_ways(int i, int j) => <(int, int)>[
      if (check(i, j - 1, find)) (i, j - 1),
      if (check(i - 1, j, find)) (i - 1, j),
      if (check(i, j + 1, find)) (i, j + 1),
      if (check(i + 1, j, find)) (i + 1, j),
    ];

    bool dfs(int i, int j) {
      if (find == word_len - 1) return true;
      find++;

      visted[i][j] = 1;
      final ways = find_ways(i, j);

      for (final (next_i, next_j) in ways) {
        if (dfs(next_i, next_j)) return true;
      }

      visted[i][j] = 0;

      find--;

      return false;
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (board[i][j].codeUnits[0] == word.codeUnits[0] && dfs(i, j)) return true;
      }
    }

    return false;
  }
}
