// 90
// ms
// Beats
// 100.00%

class Solution {
  int stoneGameVI(List<int> aliceValues, List<int> bobValues) {
    final len = aliceValues.length;
    final prio = List.generate(len, (i) => (i, aliceValues[i] + bobValues[i]))
      ..sort((a, b) => b.$2.compareTo(a.$2));
    bool alice_turn = true;
    int alice = 0;
    int bob = 0;
    for (final (i, _) in prio) {
      alice_turn ? alice += aliceValues[i] : bob += bobValues[i];

      alice_turn = !alice_turn;
    }

    if (alice > bob) return 1;
    if (alice < bob) return -1;
    return 0;
  }
}

void main(List<String> args) {
  print(Solution().stoneGameVI([1, 2], [3, 1]));
}
