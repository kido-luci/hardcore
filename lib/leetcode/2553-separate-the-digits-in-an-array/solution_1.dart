// 2
// ms
// Beats
// 100.00%

class Solution {
  List<int> separateDigits(List<int> nums) {
    final result = <int>[];

    for (final e in nums) {
      takeDigits(e, (digit) => result.add(digit));
    }

    return result;
  }

  int takeLevel(int num) {
    int level = 1;

    while ((num ~/= 10) > 0) {
      level *= 10;
    }

    return level;
  }

  void takeDigits(int num, void Function(int e) onDigit) {
    int level = takeLevel(num);

    while (level > 0) {
      final digit = num ~/ level;

      // print(digit);
      onDigit(digit);

      num -= (digit * level);
      level ~/= 10;
    }
  }
}

void main() {
  //   print(Solution().takeLevel(0));
  //   print(Solution().takeLevel(9));
  //   print(Solution().takeLevel(10));
  //   print(Solution().takeLevel(15));
  //   print(Solution().takeLevel(100));
  Solution().takeDigits(201, (e) {});
}
