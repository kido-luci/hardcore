// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isPerfectSquare(int num) {
    if (num < 2) return true;

    var left = 2, right = num ~/ 2;

    while (left <= right) {
      final mid = (right - left) ~/ 2 + left;
      final pow = mid * mid;

      if (pow == num) return true;

      if (pow > num) {
        final pre_val = mid - 1;
        final pre_pow = pre_val * pre_val;

        if (pre_pow == num) return true;

        if (pre_pow < num) return false;

        right = pre_val;
      } else {
        final next_val = mid + 1;
        final next_pow = next_val * next_val;

        if (next_pow == num) return true;

        if (next_pow > num) return false;

        left = next_val;
      }
    }

    return false;
  }
}
