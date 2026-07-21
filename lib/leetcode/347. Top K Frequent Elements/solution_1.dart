class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    final counts = <int, int>{};

    for (final e in nums) {
      counts[e] = (counts[e] ?? 0) + 1;
    }

    // print(counts);

    final sort = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    // print(sort);

    return sort.sublist(0, k).map((e) => e.key).toList();
  }
}
