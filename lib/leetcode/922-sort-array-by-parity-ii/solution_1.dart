// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> sortArrayByParityII(List<int> nums) {
    var i = 0, j = 1;

    while (i < nums.length) {
      while (nums[i].isEven && i + 2 < nums.length) i += 2;
      if (nums[i].isEven) break;
      while (nums[j].isOdd && j + 2 < nums.length) j += 2;

      final tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;

      i += 2;
      j += 2;
    }

    return nums;
  }
}
