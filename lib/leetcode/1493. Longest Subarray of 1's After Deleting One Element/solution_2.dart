import 'dart:math';

// 4ms
class Solution {
  int longestSubarray(List<int> nums) {
    var startWindow = 0;
    var longest = 0;
    final zeroIndex = <int>[];

    // loop: 0 -> n-1
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == 0) zeroIndex.add(i);

      if (zeroIndex.length > 1) {
        startWindow = zeroIndex.removeAt(0) + 1;
      }

      longest = max(longest, i - startWindow);
    }

    return longest;
  }
}
