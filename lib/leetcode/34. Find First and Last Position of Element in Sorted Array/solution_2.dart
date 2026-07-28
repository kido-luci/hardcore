// Oms - Ologn
// Input: nums = [5,7,7,8,8,10], target = 8
// Output:             [3,4]

// [5,7,7,8,8,10]
//        8,8,10
//        8,8

// 5,7,7,8,8
//       8,8
//
// ----
// ---

// [5,7,7,8,8,8,8,8,8,8,10]
//            8,8,8,8,8,10]
//                  8,8,10]
//                  8,8 => right
// [5,7,7,8,8,8,8,8,8,8
// [5,7,7,8,8
//      7,8,8
//  left<=8,8
class Solution {
  List<int> searchRange(List<int> nums, int target) {
    var i = 0, j = nums.length - 1;

    while (j >= i) {
      // print(nums.sublist(i, j + 1));

      final mid = ((j - i) ~/ 2 + i);

      // print((i, mid, j));

      if (nums[mid] <= target) {
        i = mid + 1;
      } else {
        j = mid - 1;
      }
    }

    if (j < 0 || nums[j] != target) {
      return [-1, -1];
    }

    // print(nums.sublist(0, j + 1));

    final right = j;

    i = 0;

    while (j >= i) {
      // print(nums.sublist(i, j + 1));

      final mid = ((j - i) ~/ 2 + i);

      // print((i, mid, j));

      if (nums[mid] >= target) {
        j = mid - 1;
      } else {
        i = mid + 1;
      }
    }

    return [i, right];
  }
}
