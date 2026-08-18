// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> runningSum(List<int> nums) {
    for (var i = 1; i < nums.length; i++) {
      nums[i] = nums[i] + nums[i - 1];
    }

    return nums;
  }
}
