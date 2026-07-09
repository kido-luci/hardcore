class Solution {
  int removeElement(List<int> nums, int val) {
    var j = 0;

    for (var i = 0; i < nums.length; i++) {
      // print(i);

      if (nums[i] != val) {
        nums[j] = nums[i];
        j++;
      }
    }

    return j;
  }
}
