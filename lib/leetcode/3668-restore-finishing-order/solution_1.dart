// 3
// ms
// Beats
// 80.00%

class Solution {
  List<int> recoverOrder(List<int> order, List<int> friends) {
    final result = <int>[];

    for (final e in order) {
      if (friends.contains(e)) {
        result.add(e);
      }
    }

    return result;
  }
}
