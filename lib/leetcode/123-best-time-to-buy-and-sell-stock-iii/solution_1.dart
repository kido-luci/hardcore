import 'dart:math';

// 4, 7, 2, 9
// -----------
// 0  3  3  7
// -----------
// 0 -4  -1  -1
// 0  3  3  10
//
// 5
// ms
// Beats
// 100.00%

class Solution {
  int maxProfit(List<int> prices) {
    int buy_1 = prices[0];
    int sell_1 = 0;
    int buy_2 = prices[0];
    int sell_2 = 0;

    for (var i = 1; i < prices.length; i++) {
      final e = prices[i];

      sell_1 = max(sell_1, e - buy_1);
      buy_1 = min(buy_1, e);
      sell_2 = max(sell_2, e - buy_2);
      buy_2 = min(buy_2, -sell_1 + e);
    }

    return sell_2;
  }
}

void main(List<String> args) {
  // print('result  ${Solution().maxProfit([0, 5, 5, 0, 0, 7, 1, 8])}');
  // print('result  ${Solution().maxProfit([0, 5, 5, 0, 0, 3, 1, 4])}');
  // print('result ${Solution().maxProfit([3, 3, 5, 0, 0, 3, 1, 4])}');
  // print('result  ${Solution().maxProfit([1, 2, 3, 4, 5])}');
  // print('result  ${Solution().maxProfit([7, 6, 4, 3, 1])}');
  // print('result  ${Solution().maxProfit([1, 3, 3, 2, 4, 6, 3, 10])}');
  // print('result  ${Solution().maxProfit([4, 8, 6, 8, 7, 9])}');
  // print('result  ${Solution().maxProfit([4, 8, 6, 9])}');
  // print('result  ${Solution().maxProfit([1, 1, 2, 2, 1, 1, 3, 3, 2, 4, 6, 3, 10, 5, 3])}');
  print('result  ${Solution().maxProfit([4, 7, 2, 9])}');
}
