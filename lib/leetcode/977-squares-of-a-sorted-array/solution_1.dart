// 2
// ms
// Beats
// 93.33%

class Solution {
  List<int> sortedSquares(List<int> nums) {
    var left = 0, right = nums.length - 1;

    final result = List.filled(nums.length, 0);

    for (var j = nums.length - 1; j >= 0; j--) {
      result[j] = nums[right].abs() > nums[left].abs()
          ? nums[right--]
          : nums[left++];
      result[j] *= result[j];
    }

    return result;
  }
}
