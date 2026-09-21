// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> sortArrayByParity(List<int> nums) {
    var i = 0, j = nums.length - 1;

    while (i < j) {
      while (nums[i].isEven && i < j - 1) i++;

      if (nums[i].isEven) break;

      while (nums[j].isOdd && j > i + 1) j--;

      final tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;

      i++;
      j--;
    }

    return nums;
  }
}
