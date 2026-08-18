// 0
// ms
// Beats
// 100.00%

class Solution {
  int mirrorDistance(int n) {
    int revert = 0;
    var n_tmp = n;

    while (n_tmp > 0) {
      revert = (revert * 10) + n_tmp % 10;
      n_tmp ~/= 10;
    }

    return (n - revert).abs();
  }
}
