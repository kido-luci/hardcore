class Solution {
  void count_i(String s) {
    final c = List.filled(26, 0);
    for (var i = 0; i < s.length; i++) {
      c[s.codeUnitAt(i) - 97]++;
    }
  }

  void count_e(String s) {
    final c = List.filled(26, 0);
    for (final e in s.codeUnits) {
      c[e - 97]++;
    }
  }

  void count_AZ_az_e(String s) {
    final c = List.filled(52, 0);
    for (final e in s.codeUnits) {
      c[e - (e > 96 ? (97 - 26) : 65)]++;
    }
  }

  int take_digit(String s, int i) => s.codeUnitAt(i) - 48;
}
