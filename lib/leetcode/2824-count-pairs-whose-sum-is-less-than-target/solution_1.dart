// 5
// ms
// Beats
// 57.14%

class Solution {
  int countPairs(List<int> nums, int target) {
    nums.sort();

    int count = 0;

    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] + nums[i + 1] >= target) break;

      for (var j = i + 1; j < nums.length; j++) {
        if (nums[i] + nums[j] < target) {
          count++;
        } else {
          break;
        }
      }
    }

    return count;
  }
}
