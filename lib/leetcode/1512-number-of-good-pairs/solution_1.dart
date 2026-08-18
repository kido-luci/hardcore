// 0
// ms
// Beats
// 100.00%

class Solution {
  int numIdenticalPairs(List<int> nums) {
    var pair = 0;

    final counters = List.filled(101, 0);

    for (final e in nums) {
      pair += counters[e];
      counters[e]++;
    }

    return pair;
  }
}
