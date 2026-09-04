// 0
// ms
// Beats
// 100.00%

class Solution {
  String tictactoe(List<List<int>> moves) {
    const d = 3;

    final matrix = List.generate(d, (_) => List.filled(d, 0));
    for (var i = 0; i < moves.length; i++) {
      matrix[moves[i][0]][moves[i][1]] = i.isEven ? 1 : 2;
    }

    // print(matrix);

    String? check(int v) {
      switch (v) {
        case 1:
          return 'A';
        case 2:
          return 'B';
        default:
          return null;
      }
    }

    for (var i = 0; i < d; i++) {
      int r_v = matrix[i][0];
      int c_v = matrix[0][i];

      for (var j = 1; j < d; j++) {
        final r_e = matrix[i][j];
        final c_e = matrix[j][i];

        if (r_e != r_v) r_v = 0;

        if (c_e != c_v) c_v = 0;
      }

      final r_r = check(r_v);
      if (r_r != null) return r_r;

      final c_r = check(c_v);
      if (c_r != null) return c_r;
    }

    int d1_v = matrix[0][0];
    int d2_v = matrix[0][d - 1];

    for (var i = 1; i < d; i++) {
      // l1;
      final l_2_r = matrix[i][i];
      if (l_2_r != d1_v) d1_v = 0;

      // l2;
      final r_2_l = matrix[i][d - i - 1];
      if (r_2_l != d2_v) d2_v = 0;
    }

    final d1_r = check(d1_v);
    if (d1_r != null) return d1_r;

    final d2_r = check(d2_v);
    if (d2_r != null) return d2_r;

    return moves.length == d * d ? 'Draw' : 'Pending';
  }
}
