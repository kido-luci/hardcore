import 'dart:math';

// 1
// ms
// Beats
// 89.47%

class Solution {
  bool checkPerfectNumber(int num) {
    if (num < 2) return false;

    int sum = 1;

    final mid = sqrt(num).toInt();

    for (var i = 2; i <= mid; i++) {
      if (num % i == 0) {
        sum += i;
        sum += num ~/ i;

        if (sum > num) return false;
      }
    }

    return sum == num;
  }
}

void main(List<String> args) {
  Solution().checkPerfectNumber(28);
}
