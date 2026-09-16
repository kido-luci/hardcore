// 1
// ms
// Beats
// 100.00%

class Solution {
  int countBattleships(List<List<String>> board) {
    if (board.isEmpty) return 0;

    final r = board.length, c = board.first.length;

    int ship = 0;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (board[i][j] == 'X') {
          ship++;
          board[i][j] = '.';

          var tmp_i = i + 1;
          var tmp_j = j + 1;

          while (tmp_i < r && board[tmp_i][j] == 'X') board[tmp_i++][j] = '.';
          while (tmp_j < c && board[i][tmp_j] == 'X') board[i][tmp_j++] = '.';
        }
      }
    }

    return ship;
  }
}
