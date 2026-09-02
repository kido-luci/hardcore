// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isPowerOfFour(int n) {
    if (n <= 0) return false;

    while (n > 1) {
      if (n % 4 > 0) return false;
      n ~/= 4;
    }

    return true;
  }
}
