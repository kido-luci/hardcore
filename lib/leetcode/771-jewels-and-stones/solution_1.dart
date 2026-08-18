// 2
// ms
// Beats
// 60.00%

class Solution {
  int numJewelsInStones(String jewels, String stones) {
    final jewAppeard = List.filled(52, false);

    for (final e in jewels.codeUnits) {
      jewAppeard[takeIndex(e)] = true;
    }

    return stones.codeUnits.fold(
      0,
      (s, e) => s + (jewAppeard[takeIndex(e)] ? 1 : 0),
    );
  }

  int takeIndex(int code) => code - (code < 97 ? 65 : 71);
}
