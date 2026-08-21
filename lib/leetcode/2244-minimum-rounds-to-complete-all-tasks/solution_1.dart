// 43
// ms
// Beats
// 100.00%

class Solution {
  int minimumRounds(List<int> tasks) {
    int rounds = 0;
    final counts = <int, int>{};

    for (final task in tasks) {
      if (counts[task] == null) {
        counts[task] = 1;
      } else {
        counts[task] = counts[task]! + 1;
      }
    }

    for (final e in counts.values) {
      if (e == 1) return -1;

      rounds += e ~/ 3;

      if (e % 3 > 0) {
        rounds += 1;
      }
    }

    return rounds;
  }
}
