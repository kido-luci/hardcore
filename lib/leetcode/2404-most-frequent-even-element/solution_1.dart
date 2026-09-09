import 'dart:math';

// 17
// ms
// Beats
// 100.00%

class Solution {
  int mostFrequentEven(List<int> nums) {
    final c = <int, int>{};

    int most = 0;
    int? smallest;

    for (final e in nums) {
      if (e.isOdd) continue;

      final f = c.update(e, (c) => c + 1, ifAbsent: () => 1);

      if (f > most) {
        most = f;
        smallest = e;
      } else if (f == most) {
        smallest = min(smallest!, e);
      }
    }

    return smallest ?? -1;
  }
}
