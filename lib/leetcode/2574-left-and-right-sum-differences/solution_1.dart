// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> leftRightDifference(List<int> nums) {
    int sumLeft = 0;
    final lefts = <int>[];

    for (var i = 0; i < nums.length; i++) {
      lefts.add(sumLeft);
      sumLeft += nums[i];
    }

    int sumRight = 0;
    for (var j = nums.length - 1; j >= 0; j--) {
      lefts[j] = (lefts[j] - sumRight).abs();
      sumRight += nums[j];
    }

    return lefts;
  }
}
