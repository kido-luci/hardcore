import 'dart:math';

// On^2 => not accept
// i -> n; i = buy
// [7,1,5,3,6,4]
// 7=>  0 0 0 0 0 => max = 0; buy = 7
// ---

// [1,5,3,6,4]
// 1=>4, 2, 5, 3 => max 5; buy 1

// ---

// [5,3,6,4] > (1) buy => break on each
class Solution {
  int maxProfit(List<int> prices) {
    var maxPrice = 0;
    int? buy;

    for (var i = 0; i < prices.length; i++) {
      if (buy != null && prices[i] > buy) continue;
      buy = prices[i];

      for (var j = i + 1; j < prices.length; j++) {
        maxPrice = max(prices[j] - prices[i], maxPrice);
      }
    }

    return maxPrice;
  }
}
