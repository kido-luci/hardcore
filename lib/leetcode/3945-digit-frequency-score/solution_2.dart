class Solution {
  int digitFrequencyScore(int n) {
    var sum = 0;

    for (final e in n.toString().split('')) {
      sum += int.parse(e);
    }

    return sum;
  }
}
