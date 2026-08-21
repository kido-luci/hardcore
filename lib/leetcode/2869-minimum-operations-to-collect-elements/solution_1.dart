// 5
// ms
// Beats
// 100.00%

// class Solution {
//   int minOperations(List<int> nums, int k) {
//     final appeared = <int>{};

//     for (var j = nums.length - 1; j >= 0; j--) {
//       if (nums[j] <= k && !appeared.contains(nums[j])) {
//         appeared.add(nums[j]);

//         if (appeared.length == k) {
//           // print('j $j, $appeared');

//           return nums.length - j;
//         }
//       }
//     }

//     return 0;
//   }
// }

// 1
// ms
// Beats
// 100.00%

class Solution {
  int minOperations(List<int> nums, int k) {
    final appeared = List.filled(k + 1, false);
    int count = 0;

    for (var j = nums.length - 1; j >= 0; j--) {
      if (nums[j] <= k && !appeared[nums[j]]) {
        appeared[nums[j]] = true;
        count++;

        if (count == k) {
          // print('j $j, $appeared');

          return nums.length - j;
        }
      }
    }

    return 0;
  }
}

void main(List<String> args) {
  print(Solution().minOperations([1, 2], 1));
}
