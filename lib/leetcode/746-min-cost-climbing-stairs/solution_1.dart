import 'dart:math';

// 1
// ms
// Beats
// 83.33%

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    final cheaps = <int>[cost[0], cost[1]];

    // print(cost);

    for (var i = 2; i < cost.length; i++) {
      cheaps.add(cost[i] + min(cheaps[i - 1], cheaps[i - 2]));

      // print(cheaps);
    }

    return min(cheaps.last, cheaps[cost.length - 2]);
  }
}

// 1,100,1,1,1,100,1,1,100,1

// 1 100 2 3 3 103 4 5

// // 10.  15.     20.       10.     15     30
// //             30.        25.     40.    55.
