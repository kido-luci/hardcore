// 2
// ms
// Beats
// 14.29%
class Solution {
  int minOperations(List<int> nums, int k) {
    return nums.fold(0, (previousValue, element) => previousValue + element) %
        k;
  }
}
