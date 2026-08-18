// 0
// ms
// Beats
// 100.00%

class Solution {
  int digitFrequencyScore(int n) {
    var sum = 0;

    while (n > 0) {
      sum += n % 10;
      n ~/= 10;
    }

    return sum;
  }
}
