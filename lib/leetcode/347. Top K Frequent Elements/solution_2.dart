// 13ms
class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final counts = <int, int>{};

    for (final e in nums) {
      counts[e] = (counts[e] ?? 0) + 1;
    }

    final countSwap = <int, List<int>>{};

    for (final e in counts.entries) {
      (countSwap[e.value] ??= []).add(e.key);
    }

    final result = <int>[];

    for (var i = nums.length; i > 0; i--) {
      if (countSwap[i] == null) continue;

      result.addAll(countSwap[i]!);

      if (result.length >= k) break;
    }

    return result.sublist(0, k);
  }
}
