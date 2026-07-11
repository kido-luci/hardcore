class Solution {
  int searchInsert(List<int> nums, int target) {
    var start = 0;
    var end = nums.length - 1;

    while (true) {
      final mid = start + ((end - start) ~/ 2);

      // start ... mid ... end

      //  start,target, mid , end
      if (nums[mid] >= target) {
        end = mid;
      } else {
        //  start . mid .target.. end
        start = mid;
      }

      // print(nums.sublist(start, end + 1));

      if (nums[start] >= target) {
        return start;
      }

      if (nums[end] < target) {
        return end + 1;
      }

      if (end - start == 1) {
        return end;
      }
    }
  }
}
