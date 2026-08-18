// 2
// ms
// Beats
// 66.67%

class Solution {
  List<int> findWordsContaining(List<String> words, String x) {
    final result = <int>[];
    final xChar = x.codeUnitAt(0);

    for (var i = 0; i < words.length; i++) {
      if (words[i].codeUnits.contains(xChar)) {
        result.add(i);
      }
    }

    return result;
  }
}
