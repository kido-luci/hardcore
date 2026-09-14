// ignore_for_file: unused_local_variable

class Solution {
  void scan(List<List<int>> matrix) {
    final r = matrix.length;
    final c = r > 0 ? matrix.first.length : 0;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        final e = matrix[i][j];
      }
    }
  }

  void square_scan(List<List<int>> matrix) {
    final d = matrix.length;

    for (var i = 0; i < d; i++) {
      for (var j = 0; j < d; j++) {
        final r_e = matrix[i][j];
        final c_e = matrix[j][i];
      }
    }
  }

  void square_diagonal(List<List<int>> matrix) {
    final d = matrix.length;

    for (var i = 0; i < d; i++) {
      // l1;
      final l_2_r = matrix[i][i];

      // l2;
      final r_2_l = matrix[i][d - i - 1];
    }
  }

  void fill_matrix() {
    final moves = <List<int>>[];
    final matrix = List.generate(3, (_) => List.filled(3, 0));
    for (var i = 0; i < moves.length; i++) {
      matrix[moves[i][0]][moves[i][1]] = 0;
    }
  }
}
