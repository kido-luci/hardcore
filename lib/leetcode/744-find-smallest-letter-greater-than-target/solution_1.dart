// 0
// ms
// Beats
// 100.00%

class Solution {
  String nextGreatestLetter(List<String> letters, String target) {
    final t_c = target.codeUnitAt(0);

    var l = 0, r = letters.length - 1;

    if (letters[l].codeUnitAt(0) > t_c) return letters[l];
    if (letters[r].codeUnitAt(0) <= t_c) return letters[0];

    while (l <= r) {
      final m = (r - l) ~/ 2 + l;

      if (letters[m].codeUnitAt(0) <= t_c) {
        if (letters[m + 1].codeUnitAt(0) > t_c) return letters[m + 1];

        l = m + 1;
      } else {
        if (letters[m - 1].codeUnitAt(0) <= t_c) return letters[m];

        r = m - 1;
      }
    }

    return letters.first;
  }
}
