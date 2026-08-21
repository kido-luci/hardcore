import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int findMaxConsecutiveOnes(List<int> nums) {
    int result = 0;

    int current = 0;

    for (final e in nums) {
      if (e == 0) {
        result = max(result, current);
        current = 0;
      } else {
        current++;
      }
    }

    return max(result, current);
  }
}
