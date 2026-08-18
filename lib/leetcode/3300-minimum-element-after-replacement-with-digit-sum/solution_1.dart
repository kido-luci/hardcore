import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int minElement(List<int> nums) {
    int result = calDigitSum(nums[0]);

    for (var i = 1; i < nums.length; i++) {
      result = min(result, calDigitSum(nums[i]));
    }

    return result;
  }

  int calDigitSum(int num) {
    int sum = 0;

    while (num > 0) {
      sum += num % 10;
      num ~/= 10;
    }

    return sum;
  }
}
