import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int maximumCount(List<int> nums) {
    var left = 0, right = nums.length - 1;

    int pos_count = 0;
    int neg_count = 0;

    if (nums[left] < 0) {
      if (nums[right] < 0) return nums.length;

      while (left <= right) {
        final mid = ((right - left) ~/ 2) + left;
        final val = nums[mid];

        if (val >= 0) {
          if (nums[mid - 1] < 0) {
            neg_count = mid;
            left = mid;
            break;
          }

          right = mid - 1;
        } else {
          left = mid + 1;
        }
      }

      right = nums.length - 1;
    }

    // print(nums.sublist(left, right + 1));

    if (nums[right] > 0) {
      if (nums[left] > 0) {
        pos_count = right - left + 1;
      } else {
        while (left <= right) {
          // print(nums.sublist(left, right + 1));

          final mid = ((right - left) ~/ 2) + left;
          final val = nums[mid];

          if (val == 0) {
            if (nums[mid + 1] > 0) {
              pos_count = nums.length - 1 - mid;
              break;
            }

            left = mid + 1;
          } else {
            right = mid - 1;
          }
        }
      }
    }

    return max(pos_count, neg_count);
  }
}

void main(List<String> args) {
  print(
    Solution().maximumCount([-4, -3, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]),
  );
}
