// 29
// ms
// Beats
// 56.25%

class Solution {
  int subarraySum(List<int> nums, int k) {
    int sum = 0;

    final map = <int, int>{0: 1};

    int count = 0;

    for (final e in nums) {
      sum += e;
      // print(map);

      final val = map[sum - k];

      if (val != null) count += val;

      map.update(sum, (val) => val + 1, ifAbsent: () => 1);
    }

    return count;
  }
}

// // 51
// // ms
// // Beats
// // 31.25%
// class Solution {
//   int subarraySum(List<int> nums, int k) {
//     int sum = 0;
//     final sums = nums.map((e) => sum += e).toList(growable: false);

//     final map = <int, int>{0: 1};

//     int count = 0;

//     for (final e in sums) {
//       // print(map);

//       final val = map[e - k];

//       if (val != null) count += val;

//       map.update(e, (val) => val + 1, ifAbsent: () => 1);
//     }

//     return count;
//   }
// }

void main(List<String> args) {
  print(Solution().subarraySum([1, 2, 3], 3));
  print(Solution().subarraySum([1, 1, 1], 2));
}
