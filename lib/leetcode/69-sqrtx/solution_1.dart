// 0
// ms
// Beats
// 100.00%

class Solution {
  int mySqrt(int x) {
    if (x < 2) return x;

    var l = 1, r = x - 1;

    while (l <= r) {
      final m = (r - l) ~/ 2 + l;

      final pow = m * m;

      if (pow == x) return m;

      if (pow < x) {
        if ((m + 1) * (m + 1) > x) return m;

        l = m + 1;
      } else {
        if ((m - 1) * (m - 1) <= x) return m - 1;

        r = m - 1;
      }
    }

    return 0;
  }
}

void main(List<String> args) {
  print(Solution().mySqrt(6));
}
