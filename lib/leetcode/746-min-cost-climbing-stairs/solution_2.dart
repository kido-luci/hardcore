import 'dart:math';

// 1
// ms
// Beats
// 83.33%

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    var previous = cost[0], current = cost[1];

    // print(cost);

    for (var i = 2; i < cost.length; i++) {
      final newCheap = cost[i] + min<int>(current, previous);

      previous = current;
      current = newCheap;

      // print(cheaps);
    }

    return min<int>(current, previous);
  }
}

// 1,100,1,1,1,100,1,1,100,1

// 1 100 2 3 3 103 4 5

// // 10.  15.     20.       10.     15     30
// //             30.        25.     40.    55.
