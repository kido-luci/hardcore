// 0
// ms
// Beats
// 100.00%

class Solution {
  int dominantIndex(List<int> nums) {
    var max_1 = (0, nums[0]);
    var max_2 = (1, nums[1]);

    if (max_1.$2 > max_2.$2) (max_1, max_2) = (max_2, max_1);

    for (var j = 2; j < nums.length; j++) {
      final e = nums[j];

      if (e > max_1.$2) {
        max_1 = (j, e);

        if (e > max_2.$2) {
          max_1 = max_2;
          max_2 = (j, e);
        }
      }
    }

    return max_2.$2 >= max_1.$2 * 2 ? max_2.$1 : -1;
  }
}
