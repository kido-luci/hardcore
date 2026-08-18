// 0
// ms
// Beats
// 100.00%
class Solution {
  int finalValueAfterOperations(List<String> operations) {
    int result = 0;

    for (final e in operations) {
      if (e.codeUnitAt(1) == 43) {
        result++;
      } else {
        result--;
      }
    }

    return result;
  }
}
