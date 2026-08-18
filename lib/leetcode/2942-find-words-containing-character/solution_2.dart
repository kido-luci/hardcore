// 3
// ms
// Beats
// 33.33%
class Solution {
  List<int> findWordsContaining(List<String> words, String x) {
    final result = <int>[];

    for (var i = 0; i < words.length; i++) {
      if (words[i].codeUnits.indexWhere(
            (element) => element == x.codeUnitAt(0),
          ) !=
          -1) {
        result.add(i);
      }
    }

    return result;
  }
}
