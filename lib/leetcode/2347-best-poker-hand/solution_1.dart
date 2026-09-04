import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  String bestHand(List<int> ranks, List<String> suits) {
    final s_c = List.filled(4, 0);
    final r_c = List.filled(13, 0);

    int max_r = 1;

    for (var i = 0; i < suits.length; i++) {
      final d = suits[i].codeUnitAt(0) - 97;

      if (++s_c[d] == 5) return 'Flush';
      max_r = max(max_r, ++r_c[ranks[i] - 1]);
    }

    if (max_r >= 3) return "Three of a Kind";
    if (max_r == 2) return "Pair";
    return "High Card";
  }
}
