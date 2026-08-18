class Solution {
  int digitFrequencyScore(int n) {
    final frequencyScore = List.filled(10, 0);

    for (final e in n.toString().split('')) {
      final numChar = int.parse(e);

      frequencyScore[numChar] += numChar;
    }

    return frequencyScore.fold(
      0,
      (previousValue, element) => previousValue + element,
    );
  }
}
