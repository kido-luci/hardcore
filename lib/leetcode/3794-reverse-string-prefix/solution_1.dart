// 6
// ms
// Beats
// 60.00%

class Solution {
  String reversePrefix(String s, int k) {
    final codeUnits = List.of(s.codeUnits);

    final step = ((k) / 2).floor();

    // print(mid);

    for (var i = 0; i < step; i++) {
      codeUnits[i] = s.codeUnitAt(k - i - 1);
      codeUnits[k - i - 1] = s.codeUnitAt(i);

      //   print(String.fromCharCodes(codeUnits));
    }

    return String.fromCharCodes(codeUnits);
  }
}
