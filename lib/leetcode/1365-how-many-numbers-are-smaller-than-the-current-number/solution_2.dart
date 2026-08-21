// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    final counts = List.filled(101, 0);

    for (final num in nums) {
      counts[num]++;
    }

    for (var i = 1; i < counts.length; i++) {
      counts[i] += counts[i - 1];
    }

    final result = <int>[];

    for (final num in nums) {
      if (num == 0) {
        result.add(0);
      } else {
        result.add(counts[num - 1]);
      }
    }

    return result;
  }
}
