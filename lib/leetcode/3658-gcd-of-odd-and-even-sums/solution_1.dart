// 2
// ms
// Beats
// 15.53%
// class Solution {
//   int gcdOfOddEvenSums(int n) {
//     int sumOdd = 0;
//     int sumEven = 0;

//     for (var i = 1; i <= n; i++) {
//       sumOdd += 2 * i - 1;
//       sumEven += 2 * i;
//     }

//     return sumOdd.gcd(sumEven);
//   }
// }
//
//
//
// 0
// ms
// Beats
// 100.00%

class Solution {
  int gcdOfOddEvenSums(int n) {
    return n;
  }
}

// void main(List<String> args) {
//   print(Solution().gcdOfOddEvenSums(987));
// }
