// 0
// ms
// Beats
// 100.00%

class Solution {
  int alternatingSum(List<int> nums) {
    int sum = 0;

    for (var i = 0; i < nums.length; i += 2) {
      sum += nums[i];
    }

    for (var i = 1; i < nums.length; i += 2) {
      sum -= nums[i];
    }

    return sum;
  }
}
