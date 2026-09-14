import 'dart:math';

// 3
// ms
// Beats
// 75.00%

class Solution {
  bool judgeSquareSum(int c) {
    if (c < 2) return true;

    var left = 2, right = c ~/ 2;

    while (left <= right) {
      final mid = (right - left) ~/ 2 + left;
      final pow = mid * mid;

      if (pow == c) return true;

      if (pow > c) {
        final pre_val = mid - 1;
        final pre_pow = pre_val * pre_val;

        if (pre_pow == c) return true;

        right = pre_val;

        if (pre_pow < c) break;
      } else {
        final next_val = mid + 1;
        final next_pow = next_val * next_val;

        if (next_pow == c) return true;

        if (next_pow > c) {
          right = mid;
          break;
        }

        left = next_val;
      }
    }

    left = 0;

    // print(right);

    while (left <= right) {
      final need = sqrt(c - (left * left));
      // print((left, need));

      if (need <= right && need == need.truncateToDouble()) return true;

      left++;
    }

    return false;
  }
}

void main(List<String> args) {
  print(Solution().judgeSquareSum(5));
  print(Solution().judgeSquareSum(13));
  print(Solution().judgeSquareSum(9));
}
