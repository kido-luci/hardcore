// 6
// ms
// Beats
// -%
class Solution {
  String toLowerCase(String s) {
    return String.fromCharCodes(
      s.codeUnits.map((e) => e >= 65 && e <= 90 ? e + 32 : e),
    );
  }
}
