// 0
// ms
// Beats
// 100.00%

class Solution {
  int hammingWeight(int n) {
    int count = 0;

    while (n > 0) {
      if (n % 2 == 1) count++;
      n ~/= 2;
    }

    return count;
  }
}
