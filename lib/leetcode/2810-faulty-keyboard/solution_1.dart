// 13
// ms
// Beats
// 100.00%

class Solution {
  String finalString(String s) {
    final i = 'i'.codeUnits[0];
    var result = <int>[];
    for (final e in s.codeUnits) {
      e == i ? result = result.reversed.toList() : result.add(e);
    }

    return String.fromCharCodes(result);
  }
}
