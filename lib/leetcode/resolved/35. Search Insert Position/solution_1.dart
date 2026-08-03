class Solution {
  int searchInsert(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      // run util current value is larger or equal than the target
      // cuz the list is sorted
      if (nums[i] >= target) {
        return i;
      }
    }

    // set default value to the end of list index
    return nums.length;
  }
}
