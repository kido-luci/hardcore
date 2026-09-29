import 'dart:typed_data';

// 2
// ms
// Beats
// 100.00%

class Solution {
  int totalNQueens(int n) {
    final visted_col = Uint8List(n);
    final visted_z1 = Uint8List(n * 2);
    final visted_z2 = Uint8List(n * 2 + 1);

    var count_Q = 0;

    var answer = 0;

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
      visted_col[j] = 1;
      visted_z1[z1] = 1;
      visted_z2[z2] = 1;
    }

    void pop(int i, int j, int z1, int z2) {
      count_Q--;
      visted_col[j] = 0;
      visted_z1[z1] = 0;
      visted_z2[z2] = 0;
    }

    void dfs(int start) {
      if (count_Q == n) {
        // print('--------');
        // print(can);

        // for (final e in board) print(e);
        //
        answer++;
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

    return answer;
  }
}
