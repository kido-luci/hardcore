// 9
// ms
// Beats
// 64.29%

// class Solution {
//   List<int> findDisappearedNumbers(List<int> nums) {
//     final counts = List.filled(nums.length, 0);
//     for (final num in nums) {
//       counts[num - 1]++;
//     }

//     final result = <int>[];

//     for (var i = 0; i < nums.length; i++) {
//       if (counts[i] == 0) {
//         result.add(i + 1);
//       }
//     }

//     return result;
//   }
// }

// Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
// class Solution {
//   List<int> findDisappearedNumbers(List<int> nums) {
//     nums.sort();

//     final result = <int>[];

//     int check = 1;

//     while (check < nums[0]) {
//       result.add(check);

//       check++;
//     }

//     check++;

//     for (final num in nums) {
//       if (num > check) {
//         while (check < num) {
//           result.add(check);
//           check++;
//         }

//         check++;
//       } else if (num == check) {
//         check++;
//       }
//     }

//     final end = nums.length;

//     while (check <= end) {
//       result.add(check);

//       check++;
//     }

//     return result;
//   }
// }

// void main() {
//   print(Solution().findDisappearedNumbers([7, 3, 3, 7, 7, 3, 3, 3]));
// }
