import 'dart:math';

// 46
// ms
// Beats
// 66.67%

class Solution {
  int findLHS(List<int> nums) {
    nums.sort();

    var longest = 0;
    var start = 0;
    var num_start = nums[start];

    for (var i = 1; i < nums.length; i++) {
      final num_i = nums[i];

      if (num_i - num_start == 1) {
        longest = max(longest, i - start + 1);
      } else {
        while (start < i && num_i - nums[start] > 1) {
          start++;
        }

        num_start = nums[start];
      }
    }

    return longest;
  }
}

void main(List<String> args) {
  print(Solution().findLHS([1, 3, 2, 2, 5, 2, 3, 7]));
}
