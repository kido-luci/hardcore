// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    final m = matrix.length;
    final n = matrix.first.length;

    final result = <int>[];
    final len = m * n;

    // 0: l -> r
    // 1: t -> b
    // 2: r -> l
    // 3: b -> t
    int direct = 0;

    bool valid(int i, int j) {
      if (i == -1 || i == m || j == -1 || j == n) return false;
      return matrix[i][j] != 101;
    }

    int i = 0;
    int j = 0;
    while (result.length < len) {
      result.add(matrix[i][j]);
      matrix[i][j] = 101;

      switch (direct) {
        case 0:
          if (valid(i, j + 1)) {
            j++;
          } else {
            i++;
            direct = 1;
          }
        case 1:
          if (valid(i + 1, j)) {
            i++;
          } else {
            j--;
            direct = 2;
          }
        case 2:
          if (valid(i, j - 1)) {
            j--;
          } else {
            i--;
            direct = 3;
          }
        default:
          if (valid(i - 1, j)) {
            i--;
          } else {
            j++;
            direct = 0;
          }
      }
    }

    return result;
  }
}
