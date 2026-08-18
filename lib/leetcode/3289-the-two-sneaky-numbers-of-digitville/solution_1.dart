// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> getSneakyNumbers(List<int> nums) {
    final counter = List.filled(nums.length, 0);

    int? first;

    for (final e in nums) {
      if (counter[e] != 0) {
        if (first == null) {
          first = e;
        } else {
          return [first, e];
        }
      }

      counter[e]++;
    }

    return [];
  }
}
