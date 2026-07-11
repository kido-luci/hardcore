class Solution {
  int searchInsert(List<int> nums, int target) {
    // how to impl binary search?

    var start = 0;
    var end = nums.length;

    while (start < end) {
      final mid = start + ((end - start) ~/ 2);

      if (nums[mid] < target) {
        start = mid + 1;
      } else {
        end = mid;
      }
    }

    return start;
  }
}
