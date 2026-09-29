import 'dart:typed_data';

// 224
// ms
// Beats
// 100.00%

class Solution {
  void solveSudoku(List<List<String>> board) {
    bool isEmpty(String s) => s == '.';

    int getDigit(String s) => s.codeUnits[0] - 49;

    Uint8List get_ways(int i, int j) {
      final ways = Uint8List(9);

      // print('row----------');
      for (final e in board[i]) {
        // print(e);
        if (!isEmpty(e)) ways[getDigit(e)] = 1;
      }
      // print('col----------');
      for (var i = 0; i < 9; i++) {
        final e = board[i][j];
        // print(e);
        if (!isEmpty(e)) ways[getDigit(e)] = 1;
      }
      final square_i = (i ~/ 3) * 3;
      final square_j = (j ~/ 3) * 3;

      // print('square----------');
      for (var i = square_i; i < square_i + 3; i++) {
        for (var j = square_j; j < square_j + 3; j++) {
          final e = board[i][j];
          // print(e);
          if (!isEmpty(e)) ways[getDigit(e)] = 1;
        }
      }

      return ways;
    }

    bool dfs(int i, int j) {
      if (!isEmpty(board[i][j])) {
        if (j < 8) {
          return dfs(i, j + 1);
        } else if (i < 8) {
          return dfs(i + 1, 0);
        }

        return i == 8 && j == 8;
      }

      // print('-----------');
      // print((i, j));
      // for (final e in board) {
      //   print(e);
      // }

      final ways = get_ways(i, j);

      if (i == 8 && j == 8) {
        final index = ways.indexOf(0);
        if (index == -1) return false;

        board[i][j] = (index + 1).toString();
        return true;
      }

      var next_i = i, next_j = j;
      if (j < 8) {
        next_j++;
      } else {
        next_j = 0;
        next_i++;
      }

      for (var i1 = 0; i1 < 9; i1++) {
        if (ways[i1] == 1) continue;
        board[i][j] = (i1 + 1).toString();
        if (dfs(next_i, next_j)) return true;
      }

      board[i][j] = '.';
      return false;
    }

    dfs(0, 0);
  }
}

void main(List<String> args) {
  final input = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"],
  ];
  Solution().solveSudoku(input);
}
