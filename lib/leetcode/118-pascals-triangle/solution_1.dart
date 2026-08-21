// 0
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> generate(int numRows) {
    final result = <List<int>>[
      [1],
    ];

    for (var i = 1; i < numRows; i++) {
      final newRow = <int>[1];

      for (var j = 1; j <= i - 1; j++) {
        newRow.add(result[i - 1][j - 1] + result[i - 1][j]);
      }

      newRow.add(1);

      result.add(newRow);
    }

    return result;
  }
}
