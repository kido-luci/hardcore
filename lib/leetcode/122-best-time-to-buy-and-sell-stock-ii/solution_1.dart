// [7,1,5,3,6,4]
//
//
// 0
// ms
// Beats
// 100.00%

class Solution {
  int maxProfit(List<int> prices) {
    int profit = 0;

    for (var i = 1; i < prices.length; i++) {
      if (prices[i] > prices[i - 1]) {
        profit += prices[i] - prices[i - 1];
      }
    }

    return profit;
  }
}
