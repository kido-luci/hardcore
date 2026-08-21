// 27
// ms
// Beats
// 100.00%

class Solution {
  int totalWaviness(int num1, int num2) {
    int count = 0;

    while (num1 <= num2) {
      final digits = takeDigits(num1);

      for (var i = 1; i <= digits.length - 2; i++) {
        if (digits[i - 1] < digits[i] && digits[i + 1] < digits[i]) {
          count++;
        } else if (digits[i - 1] > digits[i] && digits[i + 1] > digits[i]) {
          count++;
        }
      }

      num1++;
    }

    return count;
  }

  List<int> takeDigits(int num) {
    final result = <int>[];

    do {
      result.add(num % 10);
      num ~/= 10;
    } while (num > 0);

    return result;
  }
}
