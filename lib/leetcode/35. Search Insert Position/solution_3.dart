class Solution {
  int searchInsert(List<int> nums, int target) {
    // how to impl binary search?

    var start = 0;
    var end = nums.length - 1;

    var retry = 0;

    while (retry < 5) {
      final mid = start + ((end - start) ~/ 2);

      // print('mid $mid ${nums[mid]}');
      // print('start $start ${nums[start]}');
      // print('end $end ${nums[end]}');

      if (nums[mid] >= target) {
        // range = start ... mid
        if (mid <= start || nums[mid - 1] < target) {
          return mid;
        }

        end = mid;
      } else {
        // rage = mid ... end
        if (mid <= end) {
          return mid;
        }

        start = mid;
      }

      print(nums.sublist(start, end + 1));

      retry++;
    }

    // print('=> result: $start');
    // print('-');

    return start;
  }
}
