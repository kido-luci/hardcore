import 'dart:math';

// 2ms -> 10ms

// [7,1,5,3,6,4]
// 7=>  0 0 0 0 0 => max = 0; buy = 7
// ---

// [1,5,3,6,4]
// 1=>4, 2, 5, 3 => max 5; buy 1

// ---

// [5,3,6,4] > (1) buy => break on each

// i -> n; n =  sell;
//     [7,1,5,3,6,4]
//     0
// c = 7
// min buy = 7; => max = 7 - 7
// ---

//     [7,1,5,3,6,4]
//     -6 0
// c = 1; 1 < 7 => min buy = 7; 1 < 7 (i-1) => max cannot change
// ---

//     [7,1,5,3,6,4]
//     -2 4 0
// c = 5; 5 > 1 => min buy = 1; 5 > 1 (i-1) => max  5 -1 =4

// ---

//     [7,1,5,3,6,4]
//     -4 2 -2 0
// c = 3; 3 > 1 => min buy = 1; 3 < 5 (i-1) => max cannot change

// ---

//     [7,1,5,3,6,4]
// c = 6; 6 > 1 => min buy = 1; 6 > 3 (i-1) => max 6-1=5

// ---

//     [7,1,5,3,6,4]
// c = 4; 4 > 1 => min buy = 1; 4 < 6 (i-1) => max cannot change

class Solution {
  int maxProfit(List<int> prices) {
    if (prices.length < 2) return 0;

    int maxPrice = 0;
    int minBuy = prices[0];

    for (var i = 1; i < prices.length; i++) {
      if (prices[i] < minBuy) {
        minBuy = prices[i];
      }

      // why only check when current > pervious
      // the max from Oo 0n-2 already check;
      // so only need to check on the sell i
      // it only check should we check new profit
      // but not ensure that current profit is larger than the max profit
      // so have to compare them
      if (prices[i] > prices[i - 1]) {
        maxPrice = max(prices[i] - minBuy, maxPrice);
        // print('min: $minBuy; ${prices[i]}: max$maxPrice');
      }
    }

    return maxPrice;
  }
}
