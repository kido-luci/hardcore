// 1
// ms
// Beats
// 100.00%

class Solution {
  int differenceOfSum(List<int> nums) {
    int sum = 0;

    for (var e in nums) {
      sum += e;

      while (e > 0) {
        sum -= e % 10;
        e ~/= 10;
      }
    }

    return sum.abs();
  }
}
