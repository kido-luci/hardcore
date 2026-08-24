// 1
// ms
// Beats
// 100.00%

class Solution {
  int minimumSum(int num) {
    final digits = <int>[];

    while (num > 0) {
      digits.add(num % 10);
      num ~/= 10;
    }

    digits.sort((a, b) => b.compareTo(a));

    // print(digits);

    int sum = 0;
    int level = 1;

    for (var i = 0; i < digits.length; i++) {
      sum += digits[i] * level;

      // print((digits[i], sum));

      if (i.isOdd) {
        level *= 10;
      }
    }

    return sum;
  }
}
