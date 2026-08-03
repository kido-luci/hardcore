class Solution {
  int searchInsert(List<int> nums, int target) {
    for (
      var i = 0;
      // +1 here to avoid cut of middle value
      i < nums.length / 2 + 1;
      i++
    ) {
      // run util current value is larger or equal than the target
      // cuz the list is sorted
      if (nums[i] >= target) {
        return i;
      }

      // at the end of list the rule to stop is when
      // the current value is smaller  than the target
      if (nums[nums.length - 1 - i] < target) {
        // when the next value is smaller than the current
        // we use current index to insert
        return nums.length - i;
      }
    }

    // set default value to the end of list index
    return nums.length;
  }
}
