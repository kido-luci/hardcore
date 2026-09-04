// 4
// ms
// Beats
// -%
//
class Solution {
  String convertToBase7(int num) {
    final d = <int>[];

    bool is_neg = num < 0;

    if (is_neg) num *= -1;

    do {
      d.add((num % 7) + 48);
      num ~/= 7;
    } while (num != 0);

    if (is_neg) d.add('-'.codeUnitAt(0));

    return String.fromCharCodes(d.reversed);
  }
}
