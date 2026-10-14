// 8
// ms
// Beats
// 50.00%
class Solution {
  int arrangeCoins(int n) {
    var i = 1;

    while (n >= i) n -= i++;

    return i - 1;
  }
}
