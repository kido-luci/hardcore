// 46
// ms
// Beats
// 100.00%

class Solution {
  int minOperations(List<int> nums) {
    int operantions = 0;
    final counts = <int, int>{};

    for (final num in nums) {
      counts.update(num, (e) => e + 1, ifAbsent: () => 1);
    }

    for (final e in counts.values) {
      if (e == 1) return -1;

      operantions += e ~/ 3;

      if (e % 3 > 0) {
        operantions += 1;
      }
    }

    return operantions;
  }
}
