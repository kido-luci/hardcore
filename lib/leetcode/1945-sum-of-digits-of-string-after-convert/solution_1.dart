// 2
// ms
// Beats
// 100.00%

class Solution {
  int getLucky(String s, int k) {
    int result = s.codeUnits.fold(0, (s, e) {
      e -= 96;

      while (e > 0) {
        s += e % 10;
        e ~/= 10;
      }

      return s;
    });

    // print(result);

    while (k > 1) {
      var newResult = 0;

      while (result > 0) {
        // print('digits = ${result % 10}');

        newResult += result % 10;
        result ~/= 10;
      }

      result = newResult;

      //   print(result);

      k--;
    }

    return result;
  }
}

// void main() {
//   print(Solution().getLucky('hvmhoasabaymnmsd', 1));
// }
