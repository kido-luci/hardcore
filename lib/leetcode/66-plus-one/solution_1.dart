// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> plusOne(List<int> digits) {
    bool add = true;
    int j = digits.length - 1;
    while (add && j >= 0) {
      final val = digits[j];

      if (val < 9) {
        digits[j] = val + 1;
        add = false;
      } else {
        digits[j] = 0;
      }

      j--;
    }

    if (add) digits.insert(0, 1);

    return digits;
  }
}
