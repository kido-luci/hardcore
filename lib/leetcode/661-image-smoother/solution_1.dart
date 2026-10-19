// 7
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> imageSmoother(List<List<int>> img) {
    final m = img.length;
    final n = img.first.length;

    final result = List.generate(m, (_) => List.filled(n, 0));

    bool valid(int i, int j) {
      if (i == -1 || i == m || j == -1 || j == n) return false;
      return true;
    }

    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        int count = 0;
        int sum = 0;

        for (var i1 = i - 1; i1 <= i + 1; i1++) {
          for (var j1 = j - 1; j1 <= j + 1; j1++) {
            if (valid(i1, j1)) {
              count++;
              sum += img[i1][j1];
            }
          }
        }

        result[i][j] = sum ~/ count;
      }
    }

    return result;
  }
}
