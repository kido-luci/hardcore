import 'dart:math';

// 344
// ms
// Beats
// 80.00%

class Solution {
  int reverseBits(int n) {
    final bit = n.toRadixString(2);

    num result = 0;

    for (var j = bit.length - 1; j >= 0; j--) {
      if (bit.codeUnitAt(j) != 48) {
        result += pow(2, 31 - (bit.length - 1 - j));

        // print(31 - (bit.length - 1 - j));
      }

      // print(bit[j]);
    }

    return result.toInt();
  }
}
