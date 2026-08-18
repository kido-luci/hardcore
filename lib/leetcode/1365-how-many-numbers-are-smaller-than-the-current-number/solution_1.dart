// 13
// ms
// Beats
// 45.00%
//
class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    final result = List.of(nums);

    final smallers = List.filled(101, 0);

    nums.sort();

    for (var j = nums.length - 1; j > 0; j--) {
      final current = nums[j];

      while (j > 0 && current == nums[j - 1]) {
        j--;
      }

      smallers[current] = j;
    }

    for (var i = 0; i < result.length; i++) {
      result[i] = smallers[result[i]];
    }

    return result;
  }
}
