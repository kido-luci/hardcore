// 2
// ms
// Beats
// 75.00%

class Solution {
  List<int> finalPrices(List<int> prices) {
    final stack = <int>[];
    for (var j = prices.length - 1; j >= 0; j--) {
      while (stack.isNotEmpty && stack.last > prices[j]) stack.removeLast();
      final tmp = prices[j];

      prices[j] -= stack.lastOrNull ?? 0;

      stack.add(tmp);
    }

    return prices;
  }
}
