// 7
// ms
// Beats
// 60.00%

class Solution {
  List<int> transformArray(List<int> nums) {
    for (var i = 0; i < nums.length; i++) {
      nums[i] = nums[i].isEven ? 0 : 1;
    }

    return nums..sort();
  }
}
