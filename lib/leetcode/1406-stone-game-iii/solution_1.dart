import 'dart:math';

// 8
// ms
// Beats
// 100.00%

class Solution {
  String stoneGameIII(List<int> stoneValue) {
    final len = stoneValue.length;
    var p3 = 0;
    var p2 = stoneValue[len - 1];
    if (len == 1) return noun(p2);
    var p1 = (max(stoneValue[len - 2] + p2, stoneValue[len - 2] - p2));
    if (len == 2) return noun(p1);
    for (var j = len - 3; j >= 0; j--) {
      final sum1 = stoneValue[j];
      final sum2 = sum1 + stoneValue[j + 1];
      final sum3 = sum2 + stoneValue[j + 2];
      // print((sum1, sum2, sum3));
      (p3, p2, p1) = (p2, p1, max(sum1 - p1, max(sum2 - p2, sum3 - p3)));
    }

    return noun(p1);
  }

  String noun(int result) {
    if (result > 0) return 'Alice';
    if (result < 0) return 'Bob';
    return 'Tie';
  }
}

// Runtime Error
// 160 / 191 testcases passed
// Line 5: Exhausted heap space, trying to allocate 400032 bytes.
// Out of Memory
// class Solution {
//   String stoneGameIII(List<int> stoneValue) {
//     final mem = List.generate(stoneValue.length, (_) => List<int?>.filled(stoneValue.length, null));

//     int dfs(int i, int j) {
//       if (i > j) return 0;
//       final cache = mem[i][j];
//       if (cache != null) return cache;

//       var k = 1;
//       var sum = stoneValue[i];
//       var best = sum - dfs(i + k, j);
//       while (++k <= 3 && i + k - 1 <= j) {
//         sum += stoneValue[i + k - 1];
//         best = max(best, sum - dfs(i + k, j));
//       }

//       return mem[i][j] = best;
//     }

//     final result = dfs(0, stoneValue.length - 1);
//     if (result > 0) return 'Alice';
//     if (result < 0) return 'Bob';
//     return 'Tie';
//   }
// }

void main(List<String> args) {
  print(Solution().stoneGameIII([-1]));
  print(Solution().stoneGameIII([-2, 1]));
  print(Solution().stoneGameIII([-6, 2, 3]));
  // print(Solution().stoneGameIII([1, 2, 3]));
  // print(Solution().stoneGameIII([1, 2, 3, 7]));
}
