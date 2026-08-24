// 0
// ms
// Beats
// 100.00%

class Solution {
  int addDigits(int num) {
    int result = 0;

    while (num > 0) {
      result += num % 10;
      while (result >= 10) {
        result = result % 10 + result ~/ 10;
      }

      num ~/= 10;
    }

    return result;
  }
}
