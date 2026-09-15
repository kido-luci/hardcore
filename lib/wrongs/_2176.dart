// class Solution {
//   int countPairs(List<int> nums, int k) {
//     // print(nums.length);

//     var count = 0;

//     final map = <int, List<int>>{};

//     for (var i = 0; i < nums.length; i++) {
//       (map[nums[i]] ??= []).add(i);

//       final step = (i % k == 0)
//           ? 1
//           : k.isEven
//           ? (k + i) % k
//           : k;

//       int j;

//       if (step > i) {
//         j = step;
//       } else if (step < i) {
//         j = ((i ~/ step) + 1) * step;
//       } else {
//         j = i + step;
//       }

//       while (j < nums.length) {
//         if (nums[i] == nums[j]) {
//           print('${nums[i]} => ${(i, j)}');
//           count++;
//         }

//         j += step;
//       }
//     }

//     print(map);

//     return count;
//   }
// }

// void main(List<String> args) {
//   // print(
//   //   Solution().countPairs([
//   //     5,
//   //     5,
//   //     9,
//   //     2,
//   //     5,
//   //     5,
//   //     9,
//   //     2,
//   //     2,
//   //     5,
//   //     5,
//   //     6,
//   //     2,
//   //     2,
//   //     5,
//   //     2,
//   //     5,
//   //     4,
//   //     3,
//   //   ], 7),
//   // );
//   //

//   print(Solution().countPairs([10, 2, 3, 4, 9, 6, 3, 10, 3, 6, 3, 9, 1], 4));
// }
