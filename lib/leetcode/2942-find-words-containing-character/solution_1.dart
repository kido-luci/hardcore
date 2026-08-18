// 392
// ms
// Beats
// 0.00%
class Solution {
  List<int> findWordsContaining(List<String> words, String x) {
    final result = <int>[];

    for (var i = 0; i < words.length; i++) {
      if (words[i].contains(x)) {
        result.add(i);
      }
    }

    return result;
  }
}
