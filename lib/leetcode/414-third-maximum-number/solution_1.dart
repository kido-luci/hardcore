// 0
// ms
// Beats
// 100.00%

class Solution {
  int thirdMax(List<int> nums) {
    int max1 = nums[0];
    int? max2;
    int? max3;

    for (var i = 1; i < nums.length; i++) {
      if (nums[i] >= max1) {
        if (nums[i] == max1) continue;

        max3 = max2;
        max2 = max1;
        max1 = nums[i];
      } else if (max2 == null) {
        max2 = nums[i];
      } else if (nums[i] >= max2) {
        if (nums[i] == max2) continue;

        max3 = max2;
        max2 = nums[i];
      } else if (max3 == null || nums[i] > max3) {
        max3 = nums[i];
      }

      print((max3, max2, max1));
    }

    return max3 ?? max1;
  }
}
