import 'dart:typed_data';

// 15
// ms
// Beats
// 85.71%

class Solution {
  bool winnerSquareGame(int n) {
    final mem = Uint8List(n + 1);

    for (var i = 1; i <= n; i++) {
      int status = 0;
      var j = 1, pow = 1;
      while (pow <= i) {
        if (mem[i - pow] == 0) {
          status = 1;
          break;
        }
        j++;
        pow = j * j;
      }
      mem[i] = status;
    }

    return mem[n] == 1;
  }
}

// Runtime Error
// 66 / 72 testcases passed
// class Solution {
//   bool winnerSquareGame(int n) {
//     final win = Uint8List(n + 1);
//     final lose = Uint8List(n + 1)..[0] = 1;

//     bool dfs(int n) {
//       if (win[n] == 1) return true;
//       if (lose[n] == 1) return false;

//       var i = 1;
//       var pow = 1;
//       while (pow <= n) {
//         if (!dfs(n - pow)) {
//           win[n] = 1;
//           return true;
//         }

//         i++;
//         pow = i * i;
//       }

//       lose[n] = 1;
//       return false;
//     }

//     return dfs(n);
//   }
// }

void main(List<String> args) {
  print(Solution().winnerSquareGame(2));
}
