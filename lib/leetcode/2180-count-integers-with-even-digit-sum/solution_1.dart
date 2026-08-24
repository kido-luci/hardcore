// 0
// ms
// Beats
// 100.00%

class Solution {
  int countEven(int num) {
    var result = num ~/ 2;

    if (num % 2 == 0) {
      int sum = 0;
      while (num > 0) {
        sum += num % 10;
        num ~/= 10;
      }

      if (sum.isOdd) {
        result--;
      }
    }

    return result;
  }
}

main() {
  print(Solution().countEven(910)); //455
  print(Solution().countEven(63)); //31
  print(Solution().countEven(4)); //2
  print(Solution().countEven(30)); //14
}
