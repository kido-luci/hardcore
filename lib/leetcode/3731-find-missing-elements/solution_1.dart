// 3
// ms
// Beats
// 89.19%

class Solution {
  List<int> findMissingElements(List<int> nums) {
    final counters = List.filled(101, false);

    for (final e in nums) {
      counters[e] = true;
    }

    final start = counters.indexOf(true);
    final end = counters.lastIndexOf(true);

    final result = <int>[];

    for (var i = start + 1; i < end; i++) {
      if (!counters[i]) {
        result.add(i);
      }
    }

    return result;
  }
}
