import 'dart:math';

// 1
// ms
// Beats
// 80.95%
class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    final largest = candies.fold(0, (l, e) => max(l, e));

    final result = <bool>[];

    for (final e in candies) {
      result.add(e + extraCandies >= largest);
    }

    return result;
  }
}
