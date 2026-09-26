import 'dart:typed_data';

// 6
// ms
// Beats
// -%
class Solution {
  int maxProfit(int k, List<int> prices) {
    final first = prices[0];

    final sells = Int32List(k);
    final buys = List.filled(k, first);

    late int e, sell, buy, today_sell, today_buy, pre_sell;

    for (var i = 1; i < prices.length; i++) {
      e = prices[i];
      pre_sell = 0;

      for (var j = 0; j < k; j++) {
        sell = sells[j];
        buy = buys[j];

        today_sell = e - buy;
        today_buy = -pre_sell + e;

        pre_sell = today_sell > sell ? (sells[j] = today_sell) : sell;

        if (today_buy < buy) buys[j] = today_buy;
      }
    }

    return sells.last;
  }
}

// 28
// ms
// Beats
// -%
// class Solution {
//   int maxProfit(int k, List<int> prices) {
//     final first = prices[0];

//     final trancs = List.filled(k, (0, first));

//     for (var i = 1; i < prices.length; i++) {
//       final e = prices[i];

//       var (sell_1, buy_1) = trancs[0];

//       sell_1 = max(sell_1, e - buy_1);
//       buy_1 = min(buy_1, e);

//       trancs[0] = (sell_1, buy_1);

//       for (var i = 1; i < k; i++) {
//         var (sell_2, buy_2) = trancs[i];

//         sell_2 = max(sell_2, e - buy_2);
//         buy_2 = min(buy_2, -trancs[i - 1].$1 + e);

//         trancs[i] = (sell_2, buy_2);
//       }
//     }

//     return trancs.last.$1;
//   }
// }

void main(List<String> args) {
  print(Solution().maxProfit(2, [3, 2, 6, 5, 0, 3]));
  print(Solution().maxProfit(2, [2, 1, 4]));
}
