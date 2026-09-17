// 1
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> matrixReshape(List<List<int>> mat, int r, int c) {
    final m_r = mat.length;
    final m_c = mat.first.length;

    if (r * c != m_r * m_c) return mat;

    var n_i = 0, n_j = 0;

    final n_gird = List<List<int>>.generate(r, (_) => List.filled(c, 0));

    for (var i = 0; i < m_r; i++) {
      for (var j = 0; j < m_c; j++) {
        n_gird[n_i][n_j] = mat[i][j];

        if (n_j < c - 1) {
          n_j++;
        } else {
          n_j = 0;
          n_i++;
        }
      }
    }

    return n_gird;
  }
}

void main(List<String> args) {
  print(
    Solution().matrixReshape(
      [
        [1, 2],
        [3, 4],
      ],
      4,
      1,
    ),
  );
}
