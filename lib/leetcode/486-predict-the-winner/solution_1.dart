// 1
// ms
// Beats
// 75.00%

class Solution {
  bool predictTheWinner(List<int> nums) {
    final mem = List.generate(nums.length, (_) => List<(int, int)?>.filled(nums.length, null));

    (int, int) dfs(int i, int j) {
      final cache = mem[i][j];
      if (cache != null) return cache;

      if (i == j) return (nums[i], 0);

      final (w1_p1, w1_p2) = dfs(i + 1, j);
      final take_1 = nums[i] + w1_p2;
      final (w2_p1, w2_p2) = dfs(i, j - 1);
      final take_2 = nums[j] + w2_p2;

      if (take_1 - w1_p1 > take_2 - w2_p1) {
        return mem[i][j] = (take_1, w1_p1);
      } else {
        return mem[i][j] = (take_2, w2_p1);
      }
    }

    final (p1, p2) = dfs(0, nums.length - 1);

    return (p1 >= p2);
  }
}

// 219
// ms
// Beats
// 12.50%
// class Solution {
//   bool predictTheWinner(List<int> nums) {
//     (int, int) dfs(int i, int j) {
//       if (i == j) return (nums[i], 0);

//       final (w1_p1, w1_p2) = dfs(i + 1, j);
//       final take_1 = nums[i] + w1_p2;
//       final diff_1 = take_1 - w1_p1;
//       final (w2_p1, w2_p2) = dfs(i, j - 1);
//       final take_2 = nums[j] + w2_p2;
//       final diff_2 = take_2 - w2_p1;

//       if (diff_1 > diff_2) {
//         return (take_1, w1_p1);
//       } else {
//         return (take_2, w2_p1);
//       }
//     }

//     final (p1, p2) = dfs(0, nums.length - 1);

//     return (p1 >= p2);
//   }
// }
