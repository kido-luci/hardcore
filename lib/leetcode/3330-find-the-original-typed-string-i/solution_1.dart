// 312
// ms
// Beats
// 100.00%

class Solution {
  int possibleStringCount(String word) {
    int count = 1;
    var pre = word.codeUnits[0];
    for (var i = 1; i < word.length; i++) {
      final val = word.codeUnits[i];
      if (pre == val) count++;
      pre = val;
    }

    return count;
  }
}
