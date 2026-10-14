// 43
// ms
// Beats
// 100.00%

class Solution {
  int change(int amount, List<int> coins) {
    final counts = List.filled(amount + 1, 0)..[0] = 1;

    for (final c in coins) {
      for (var i = c; i <= amount; i++) {
        if (counts[i - c] >= 1) counts[i] += counts[i - c];
      }
    }

    // print(counts);

    return counts[amount];
  }
}

void main(List<String> args) {
  print(Solution().change(5, [1, 2, 5]));
}
