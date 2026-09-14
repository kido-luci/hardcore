import 'dart:math';
import 'dart:typed_data';

// 2
// ms
// Beats
// 100.00%

class Solution {
  int maxAreaOfIsland(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;

    int best = 0;
    int area = 0;

    final stack_i = Uint8List(r * c);
    final stack_j = Uint8List(r * c);
    var stack_len = 0;

    void add_2_q(int i, int j) {
      area++;
      grid[i][j] = 2;
      stack_i[stack_len] = i;
      stack_j[stack_len] = j;

      stack_len++;
    }

    void check(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (grid[i][j] != 1) return;

      add_2_q(i, j);
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (grid[i][j] != 1) continue;

        area = 0;

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

        best = max(area, best);
      }
    }

    return best;
  }
}

void main(List<String> args) {
  print(
    Solution().maxAreaOfIsland([
      [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
    ]),
  );
}
