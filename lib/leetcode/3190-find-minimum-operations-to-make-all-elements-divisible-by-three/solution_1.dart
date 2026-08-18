// 1
// ms
// Beats
// 100.00%

class Solution {
  int minimumOperations(List<int> nums) {
    var operations = 0;

    for (final e in nums) {
      operations += e % 3 > 0 ? 1 : 0;
    }

    return operations;
  }
}
