// 1
// ms
// Beats
// 50.00%

class Solution {
  int finalValueAfterOperations(List<String> operations) {
    int result = 0;

    for (final e in operations) {
      switch (e) {
        case '++X':
        case 'X++':
          result++;
          break;
        default:
          result--;
      }
    }

    return result;
  }
}
