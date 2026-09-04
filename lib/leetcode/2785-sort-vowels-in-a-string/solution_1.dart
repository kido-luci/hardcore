// 66
// ms
// Beats
// 100.00%

class Solution {
  String sortVowels(String s) {
    final vowels = 'aeiouAEIOU'.codeUnits.toSet();
    final to_r_i = <int>[];
    var to_r_e = <int>[];
    for (var i = 0; i < s.length; i++) {
      final c = s.codeUnitAt(i);
      if (vowels.contains(c)) {
        to_r_i.add(i);
        to_r_e.add(c);
      }
    }

    to_r_e.sort();

    final r = s.codeUnits.toList();

    for (var i = 0; i < to_r_i.length; i++) {
      r[to_r_i[i]] = to_r_e[i];
    }

    return String.fromCharCodes(r);
  }
}
