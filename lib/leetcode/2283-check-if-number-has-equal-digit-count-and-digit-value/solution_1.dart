// 1
// ms
// Beats
// 100.00%

class Solution {
  bool digitCount(String num) {
    final count = List.filled(num.length, 0);

    for (var i = 0; i < num.length; i++) {
      final digit = num.codeUnits[i] - 48;
      count[i] -= digit;
      if (digit <= num.length - 1) count[digit]++;
    }

    return count.indexWhere((element) => element != 0) == -1;
  }
}
