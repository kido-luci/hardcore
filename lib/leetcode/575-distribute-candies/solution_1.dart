// 22
// ms
// Beats
// 100.00%

class Solution {
  int distributeCandies(List<int> candyType) {
    final set = <int>{};

    for (final e in candyType) {
      if (set.add(e) && set.length == candyType.length / 2) break;
    }

    return set.length;
  }
}
