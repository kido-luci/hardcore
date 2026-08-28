// 2
// ms
// Beats
// 100.00%

class Solution {
  bool isValidSudoku(List<List<String>> board) {
    final c_row = List.filled(9, false);
    final c_col = List.filled(9, false);

    void clear(List<bool> counts) {
      for (var i = 0; i < 9; i++) {
        counts[i] = false;
      }
    }

    bool check_dup(List<bool> counts, int digit) =>
        digit < 0 || (!counts[digit] && (counts[digit] = true));

    for (var i = 0; i < 9; i++) {
      clear(c_row);
      clear(c_col);

      for (var j = 0; j < 9; j++) {
        if (!(check_dup(c_row, get_digit(board[i][j])))) return false;
        if (!check_dup(c_col, get_digit(board[j][i]))) return false;
      }
    }

    bool checkSquare(int r, int c) {
      clear(c_row);

      for (var i = r; i < r + 3; i++) {
        for (var j = c; j < c + 3; j++) {
          // print(board[i][j]);
          if (!check_dup(c_row, get_digit(board[i][j]))) return false;
        }
      }

      return true;
    }

    for (var i = 0; i < 9; i += 3) {
      for (var j = 0; j < 9; j += 3) {
        // print('-===-');

        if (!checkSquare(i, j)) return false;
      }
    }

    return true;
  }

  int get_digit(String s) => s.codeUnitAt(0) - 49;
}
