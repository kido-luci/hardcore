// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> selfDividingNumbers(int left, int right) {
    final result = <int>[];

    while (left <= right) {
      var tmp = left;
      bool is_valid = true;

      while (tmp > 0) {
        final digit = tmp % 10;

        if (digit == 0 || left % digit != 0) {
          is_valid = false;
          break;
        }

        tmp ~/= 10;
      }

      if (is_valid) result.add(left);

      left++;
    }

    return result;
  }
}
