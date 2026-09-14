// 293
// ms
// Beats
// 95.00%

import 'dart:typed_data';

class Solution {
  int numIslands(List<List<String>> grid) {
    final r = grid.length;
    final c = grid.first.length;

    int count = 0;

    final len = r * c;

    final stack_i = len > 256 ? Uint16List(len) : Uint8List(len);
    final stack_j = len > 256 ? Uint16List(len) : Uint8List(len);
    var stack_len = 0;

    void add_2_q(int i, int j) {
      grid[i][j] = '2';
      stack_i[stack_len] = i;
      stack_j[stack_len] = j;

      stack_len++;
    }

    void check(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (grid[i][j] != '1') return;

      add_2_q(i, j);
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (grid[i][j] != '1') continue;

        count++;

        add_2_q(i, j);

        while (stack_len > 0) {
          stack_len--;
          final i_1 = stack_i[stack_len];
          final j_1 = stack_j[stack_len];

          check(i_1 - 1, j_1);
          check(i_1, j_1 - 1);
          check(i_1 + 1, j_1);
          check(i_1, j_1 + 1);
        }
      }
    }

    return count;
  }
}
