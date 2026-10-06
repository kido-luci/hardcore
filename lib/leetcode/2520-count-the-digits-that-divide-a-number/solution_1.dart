// 0
// ms
// Beats
// 100.00%

class Solution {
  int countDigits(int num) {
    int count = 0;
    var temp = num;

    while (temp > 0) {
      if (num % (temp % 10) == 0) count++;
      temp ~/= 10;
    }

    return count;
  }
}
