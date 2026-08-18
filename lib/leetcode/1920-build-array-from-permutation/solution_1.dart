// 1
// ms
// Beats
// 72.73%

class Solution {
  List<int> buildArray(List<int> nums) {
    final permutation = <int>[];

    for (var i = 0; i < nums.length; i++) {
      permutation.add(nums[nums[i]]);
    }

    return permutation;
  }
}

// class Solution {
//   List<int> buildArray(List<int> nums) {
//     var i = 0;

//     final index = nums[i];

//     var tmp = nums[i];

//     nums[i] = nums[index];
//   }
// }
