class Solution {
  int removeDuplicates(List<int> nums) {
    // unique count
    var count = 0;

    for (var i = 0; i < nums.length; i++) {
      // set back to the original list
      nums[count] = nums[i];

      while (i < nums.length - 1 && nums[count] == nums[i + 1]) {
        // move the pointer until next not match
        i++;
      }

      // increase the counter
      count++;
    }

    return count;
  }
}
