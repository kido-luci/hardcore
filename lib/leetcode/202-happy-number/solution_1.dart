// 3
// ms
// Beats
// 84.09%

class Solution {
  bool isHappy(int n) {
    final mem = <int>{};

    while (n != 1) {
      // print(n);
      if (!mem.add(n)) break;

      var tmp = 0;

      while (n > 0) {
        final digit = n % 10;
        // print(digit);
        tmp += (digit * digit);
        n ~/= 10;
      }

      n = tmp;
    }

    return n == 1;
  }
}

void main(List<String> args) {
  print(Solution().isHappy(19));
}
