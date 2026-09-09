import 'dart:typed_data';

// 2
// ms
// Beats
// 100.00%

class Solution {
  int findMaxK(List<int> nums) {
    final count = Uint8List(2001);
    var best = -1;

    for (final e in nums) {
      if (e.abs() <= best) continue;

      if (e > 0) {
        if (count[e + 1000] == 1) {
          best = e;
        } else {
          count[e] = 1;
        }
      } else if (e < 0) {
        if (count[-e] == 1) {
          best = -e;
        } else {
          count[-e + 1000] = 1;
        }
      }
    }

    return best;
  }
}
