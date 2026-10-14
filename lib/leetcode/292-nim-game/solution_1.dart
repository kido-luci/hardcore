// 0
// ms
// Beats
// 100.00%

class Solution {
  bool canWinNim(int n) {
    return n % 4 != 0;
  }
}

// Time Limit Exceeded
// 51 / 60 testcases passed
// class Solution {
//   bool canWinNim(int n) {
//     if (n < 4) return true;

//     bool pre1 = true;
//     bool pre2 = true;
//     bool pre3 = true;

//     int start = 4;

//     while (start++ <= n) {
//       (pre1, pre2, pre3) = (pre2, pre3, !(pre1 && pre2 && pre3));
//     }

//     return pre3;
//   }
// }

// class Solution {
//   bool canWinNim(int n) {
//     if (n < 4) return true;
//     var win = 3;
//     var lose = 4;

//     bool dfs(n) {
//       if (win == n) return true;
//       if (lose == n) return false;

//       for (var i = 1; i < 4; i++) {
//         if (!dfs(n - i)) {
//           win = n;

//           return true;
//         }
//       }

//       lose = n;

//       return false;
//     }

//     return dfs(n);
//   }
// }

// class Solution {
//   bool canWinNim(int n) {
//     if (n < 4) return true;
//     final win = <int>{1, 2, 3};
//     final lose = <int>{4};

//     bool dfs(n) {
//       if (win.contains(n)) return true;
//       if (lose.contains(n)) return false;

//       for (var i = 1; i < 4; i++) {
//         if (!dfs(n - i)) {
//           win.add(n);

//           return true;
//         }
//       }

//       lose.add(n);

//       return false;
//     }

//     return dfs(n);
//   }
// }

void main(List<String> args) {
  print(Solution().canWinNim(3));
}
