// Oms - On
class Solution {
  List<int> searchRange(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == target) {
        for (var j = nums.length - 1; j >= i; j--) {
          if (nums[j] == target) {
            return [i, j];
          }
        }
      }
    }

    return [-1, -1];
  }
}
