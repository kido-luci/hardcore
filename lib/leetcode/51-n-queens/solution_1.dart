import 'dart:typed_data';

// 5
// ms
// Beats
// 100.00%

class Solution {
  List<List<String>> solveNQueens(int n) {
    final result = <List<String>>[];

    final k_space = '.'.codeUnits[0];
    final k_Q = 'Q'.codeUnits[0];

    final visted_col = Uint8List(n);
    final visted_z1 = Uint8List(n * 2);
    final visted_z2 = Uint8List(n * 2 + 1);

    final board = List.generate(n, (_) => List.filled(n, k_space));

    var count_Q = 0;

    int get_z1(int i, int j) {
      return j - i + n - 1;
    }

    int get_z2(int i, int j) {
      return i + j;
    }

    bool check_col(int j) => visted_col[j] == 0;
    bool check_z1(int z) => visted_z1[z] == 0;
    bool check_z2(int z) => visted_z2[z] == 0;

    void push(int i, int j, int z1, int z2) {
      count_Q++;
      board[i][j] = k_Q;
      visted_col[j] = 1;
      visted_z1[z1] = 1;
      visted_z2[z2] = 1;
    }

    void pop(int i, int j, int z1, int z2) {
      count_Q--;
      board[i][j] = k_space;
      visted_col[j] = 0;
      visted_z1[z1] = 0;
      visted_z2[z2] = 0;
    }

    void dfs(int start) {
      if (count_Q == n) {
        // print('--------');
        // print(can);

        result.add(board.map((e) => String.fromCharCodes(e)).toList());

        // for (final e in board) print(e);
        return;
      }

      if (start == n) return;

      for (var j = 0; j < n; j++) {
        if (!check_col(j)) continue;

        final z1 = get_z1(start, j);
        if (!check_z1(z1)) continue;

        final z2 = get_z2(start, j);
        if (!check_z2(z2)) continue;

        push(start, j, z1, z2);
        dfs(start + 1);
        pop(start, j, z1, z2);
      }
    }

    dfs(0);

    return result;
  }
}

// 100
// ms
// Beats
// 0.00%
// class Solution {
//   List<List<String>> solveNQueens(int n) {
//     final result = <List<String>>[];

//     final k_space = '.'.codeUnits[0];
//     final k_Q = 'Q'.codeUnits[0];

//     final visted_row = Uint8List(n);
//     final visted_col = Uint8List(n);
//     final visted_z1 = Uint8List(n * 2);
//     final visted_z2 = Uint8List(n * 2 + 1);

//     final board = List.generate(n, (_) => List.filled(n, k_space));

//     var count_Q = 0;

//     int get_z1(int i, int j) {
//       while (i > 0 && j > 0) {
//         i--;
//         j--;
//       }

//       return (n - i) + j;
//     }

//     int get_z2(int i, int j) {
//       while (i > 0 && j < n - 1) {
//         i--;
//         j++;
//       }

//       return (n - i) + (n - j);
//     }

//     bool check_row(int i) => visted_row[i] == 0;
//     bool check_col(int j) => visted_col[j] == 0;
//     bool check_z1(int z) => visted_z1[z] == 0;
//     bool check_z2(int z) => visted_z2[z] == 0;

//     void push(int i, int j, int z1, int z2) {
//       count_Q++;
//       board[i][j] = k_Q;
//       visted_row[i] = 1;
//       visted_col[j] = 1;
//       visted_z1[z1] = 1;
//       visted_z2[z2] = 1;
//     }

//     void pop(int i, int j, int z1, int z2) {
//       count_Q--;
//       board[i][j] = k_space;
//       visted_row[i] = 0;
//       visted_col[j] = 0;
//       visted_z1[z1] = 0;
//       visted_z2[z2] = 0;
//     }

//     void dfs(int start) {
//       if (count_Q == n) {
//         // print('--------');
//         // print(can);

//         result.add(board.map((e) => String.fromCharCodes(e)).toList());

//         // for (final e in board) print(e);
//         return;
//       }

//       for (var i = start; i < n; i++) {
//         if (!check_row(i)) continue;

//         for (var j = 0; j < n; j++) {
//           if (!check_col(j)) continue;

//           final z1 = get_z1(i, j);
//           if (!check_z1(z1)) continue;

//           final z2 = get_z2(i, j);
//           if (!check_z2(z2)) continue;

//           push(i, j, z1, z2);
//           dfs(i + 1);
//           pop(i, j, z1, z2);
//         }
//       }
//     }

//     dfs(0);

//     return result;
//   }
// }

void main(List<String> args) {
  print(Solution().solveNQueens(5));
}
