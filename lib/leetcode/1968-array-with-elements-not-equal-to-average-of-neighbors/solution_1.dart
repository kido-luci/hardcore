// 241
// ms
// Beats
// -%
//
class Solution {
  List<int> rearrangeArray(List<int> nums) {
    nums.sort();

    var i = 0, j = nums.length - 1;
    bool revert = true;

    final results = <int>[];

    while (i <= j) {
      if (revert) {
        results.add(nums[i]);
        i++;
      } else {
        results.add(nums[j]);
        j--;
      }

      revert = !revert;
    }

    return results;
  }
}
