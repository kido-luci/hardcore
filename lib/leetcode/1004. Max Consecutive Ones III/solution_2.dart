// Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
// Output: 10
// Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
// Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.

// [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
// [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
//      1,1,1,1,1,1,1,1,1,1, len = result = 10
//      1,1,0,0,1,1,1,0,1,1, total 0 = 3 = k
import 'dart:math';

// 1 ~ 20ms On
// last0Index = stacks0[stackIndex];
class Solution {
  int longestOnes(List<int> nums, int k) {
    final stacks0 = <int>[];
    var longest = 0;
    int last0Index = -1;
    int stackIndex = -1;

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        stacks0.add(i);
      }

      if (stacks0.length - 1 - stackIndex > k) {
        stackIndex++;
        last0Index = stacks0[stackIndex];
      }

      longest = max(longest, i - last0Index);
    }

    return longest;
  }
}
