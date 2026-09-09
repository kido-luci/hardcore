import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int subarraySum(List<int> nums) {
    var sum = nums.first;

    for (var i = 1; i < nums.length; i++) {
      final start = max(0, i - nums[i]);
      print(start);
      if (start > 0) sum -= nums[start - 1];

      sum += (nums[i] += nums[i - 1]);
    }

    return sum;
  }
}
