// 2
// ms
// Beats
// 100.00%

class Solution {
  String restoreString(String s, List<int> indices) {
    final codeUnits = List.filled(s.length, 97);

    for (var i = 0; i < s.length; i++) {
      codeUnits[indices[i]] = s.codeUnitAt(i);
    }

    return String.fromCharCodes(codeUnits);
  }
}
