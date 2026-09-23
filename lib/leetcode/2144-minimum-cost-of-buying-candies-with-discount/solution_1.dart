// 6
// ms
// Beats
// 100.00%

class Solution {
  int minimumCost(List<int> cost) {
    cost.sort((a, b) => b.compareTo(a));

    var buy = 0;

    var len = cost.length;
    final end = (cost.length ~/ 3) * 3;

    for (var i = 0; i < end; i += 3) {
      buy += cost[i] + cost[i + 1];
    }

    for (var i = end; i < end + (len % 3); i++) buy += cost[i];

    return buy;
  }
}

void main(List<String> args) {
  print(Solution().minimumCost([1, 2, 3]));
}
