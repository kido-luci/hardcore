// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isStrictlyPalindromic(int n) {
    int b = 2;

    do {
      if (!check(n, b)) {
        return false;
      }

      b++;
    } while (b < n - 1);

    return true;
  }

  bool check(int n, int b) {
    // print(b);

    final radix = n.toRadixString(b);

    // print(radix);

    final mid = (radix.length / 2).floor();

    for (var i = 0; i <= mid; i++) {
      if (radix.codeUnitAt(i) != radix.codeUnitAt(radix.length - 1 - i)) {
        return false;
      }
    }

    return true;
  }
}

// main() {
//   // print(Solution().check(9, 2));
//   // print(Solution().check(4, 2));
//   //
//   print(Solution().isStrictlyPalindromic(5));
// }
