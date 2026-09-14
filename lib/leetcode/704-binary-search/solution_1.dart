// 0
// ms
// Beats
// 100.00%

class Solution {
  int search(List<int> nums, int target) {
    var left = 0, right = nums.length - 1;

    if (target < nums[left] || target > nums[right]) return -1;

    while (left <= right) {
      final mid = ((right - left) ~/ 2) + left;
      final val = nums[mid];

      if (target == val) return mid;

      if (target > val) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return -1;
  }
}
