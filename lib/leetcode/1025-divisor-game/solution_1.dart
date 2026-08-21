// 0
// ms
// Beats
// 100.00%

class Solution {
  bool divisorGame(int n) {
    return n.isEven;
  }
}

// 1 -> lose
// 2 -> win
// 3 -> lose
// 4 -> 1(3) win ; 2(2) lose => win
// 5 -> 1(4) lose
// 6 -> 1(5) win 2(4) lose 3(3) win => win
// 7 -> 1(6) lose
// 8 -> 1(7)win 2(6)lose 4(4)lose => win
// 9 -> 1(8)lose 3(6)lose => lose
