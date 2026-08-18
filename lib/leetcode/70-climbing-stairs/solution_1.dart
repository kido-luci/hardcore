// 0
// ms
// Beats
// 100.00%

class Solution {
  int climbStairs(int n) {
    if (n < 3) {
      return n;
    }

    final records = <int>[1, 2];

    for (var i = 3; i <= n; i++) {
      records.add(records[i - 1 - 1] + records[i - 2 - 1]);
    }

    return records.last;
  }
}
