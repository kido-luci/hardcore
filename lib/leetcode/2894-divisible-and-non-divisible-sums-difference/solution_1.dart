// 0
// ms
// Beats
// 100.00%

class Solution {
  int differenceOfSums(int n, int m) {
    var sum = 0;

    for (var i = 1; i <= n; i++) {
      if (i % m == 0) {
        sum -= i;
      } else {
        sum += i;
      }
    }

    return sum;
  }
}
