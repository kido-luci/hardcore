// 57
// ms
// Beats
// 100.00%

class Solution {
  int arrayPairSum(List<int> nums) {
    nums.sort();

    var sum = 0;

    for (var i = 0; i < nums.length; i += 2) {
      sum += nums[i];
    }

    return sum;
  }
}
