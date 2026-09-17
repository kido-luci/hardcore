import 'dart:math';

// 2
// ms
// Beats
// 91.53%

class Solution {
  int maximumProduct(List<int> nums) {
    final max_val = nums.sublist(0, 3)..sort();

    final min_val = [max_val[1], max_val[0]];

    for (var j = 3; j < nums.length; j++) {
      final e = nums[j];

      if (e > max_val[0]) {
        max_val[0] = e;

        for (var i = 1; i < 3; i++) {
          if (e > max_val[i]) {
            max_val[i - 1] = max_val[i];
            max_val[i] = e;
          } else {
            break;
          }
        }
      }

      if (e < min_val[0]) {
        min_val[0] = e;

        if (e < min_val[1]) {
          min_val[0] = min_val[1];
          min_val[1] = e;
        }
      }
    }

    return max(
      max_val[0] * max_val[1] * max_val[2],
      min_val[0] * min_val[1] * max_val[2],
    );
  }
}

void main(List<String> args) {
  // print(Solution().maximumProduct([1, 2, 3, 4]));
  // print(Solution().maximumProduct([-1, -2, -3]));
  print(Solution().maximumProduct([-100, -2, -3, 1]));
  print(Solution().maximumProduct([-7, 1, 0, -4]));
}
