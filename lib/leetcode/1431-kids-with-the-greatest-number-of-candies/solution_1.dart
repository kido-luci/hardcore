import 'dart:math';

// 2
// ms
// Beats
// 42.86%
class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    int largest = candies.fold(0, (l, e) => max(l, e));

    return candies.map((e) => e + extraCandies >= largest).toList();
  }
}
