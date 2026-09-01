// 43
// ms
// Beats
// 10.26%
class Solution {
  void moveZeroes(List<int> nums) {
    for (var j = nums.length - 1; j >= 0; j--) {
      if (nums[j] == 0) {
        var i = j;

        while (i < nums.length - 1 && nums[i + 1] != 0) {
          nums[i] = nums[i + 1];
          i++;
        }

        nums[i] = 0;
      }
    }
  }
}
