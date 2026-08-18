// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> concatWithReverse(List<int> nums) {
    for (var i = nums.length - 1; i >= 0; i--) {
      nums.add(nums[i]);
    }

    return nums;
  }
}
