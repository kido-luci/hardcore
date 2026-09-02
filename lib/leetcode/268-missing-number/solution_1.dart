// 0
// ms
// Beats
// 100.00%

class Solution {
  int missingNumber(List<int> nums) {
    var total = nums.length;
    var sum = 0;

    for (var i = 0; i < nums.length; i++) {
      total += i;
      sum += nums[i];
    }

    return total - sum;
  }
}
