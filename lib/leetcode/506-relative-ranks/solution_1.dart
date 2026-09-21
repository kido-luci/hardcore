// 12
// ms
// Beats
// 100.00%

class Solution {
  List<String> findRelativeRanks(List<int> score) {
    final sorted = List.generate(score.length, (i) => i)
      ..sort((a, b) => score[b].compareTo(score[a]));

    final result = List.filled(score.length, '');

    for (var i = 0; i < score.length; i++) {
      final String rank;

      if (i > 2) {
        rank = (i + 1).toString();
      } else {
        switch (i) {
          case 0:
            rank = "Gold Medal";
          case 1:
            rank = "Silver Medal";
          default:
            rank = "Bronze Medal";
        }
      }

      result[sorted[i]] = rank;
    }

    return result;
  }
}
