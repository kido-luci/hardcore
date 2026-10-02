// 0
// ms
// Beats
// 100.00%

class Solution {
  bool stoneGame(List<int> piles) {
    return true;
  }
}

// import 'dart:math';

// 15
// ms
// Beats
// 4.55%
// class Solution {
//   bool stoneGame(List<int> piles) {
//     final mem = List.generate(piles.length, (_) => List<int?>.filled(piles.length, null));

//     int dfs(int i, int j) {
//       final cache = mem[i][j];
//       if (cache != null) return cache;
//       if (i == j) return piles[i];

//       return mem[i][j] = max(piles[i] - dfs(i + 1, j), piles[j] - dfs(i, j - 1));
//     }

//     return dfs(0, piles.length - 1) > 0;
//   }
// }
