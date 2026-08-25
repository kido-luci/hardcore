// 0
// ms
// Beats
// 100.00%

class Solution {
  int singleNumber(List<int> nums) {
    int bytes = nums[0];

    for (var i = 1; i < nums.length; i++) {
      bytes ^= nums[i];
    }

    return bytes;
  }
}
