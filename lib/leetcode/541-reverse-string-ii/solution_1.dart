import 'dart:math';

// 5
// ms
// Beats
// 50.00%
class Solution {
  String reverseStr(String s, int k) {
    final result = <int>[];

    int start = 0;

    final len = s.length;

    while (start < len) {
      var t_e = min(len - 1, start + k - 1);
      for (var j = t_e; j >= start; j--) {
        result.add(s.codeUnits[j]);
      }

      t_e = min(start + (2 * k) - 1, len - 1);
      for (var i = start + k; i <= t_e; i++) {
        result.add(s.codeUnits[i]);
      }

      start += 2 * k;
    }

    return String.fromCharCodes(result);
  }
}

void main(List<String> args) {
  print(Solution().reverseStr("abcdefg", 2));
}
