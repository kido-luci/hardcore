// 2
// ms
// Beats
// 100.00%

class Solution {
  int findPermutationDifference(String s, String t) {
    final s_index = List.filled(26, 0);

    for (var i = 0; i < s.length; i++) {
      s_index[s.codeUnitAt(i) - 97] = i;
    }

    var sum = 0;

    for (var i = 0; i < t.length; i++) {
      sum += (i - s_index[t.codeUnitAt(i) - 97]).abs();
    }

    return sum;
  }
}
