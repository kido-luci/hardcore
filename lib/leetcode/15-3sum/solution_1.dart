// 3 <= nums.len <= 3000

// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0. => -1, 0, 1
// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0. => 0, 1, -1
// set must not contain duplicate triplets = > -1, 0, 1 = 0, 1, -1 => just keep one version is ok
// Notice: the order of output and triplets doesn't matter

// n[i] + n[j] + n[k] = 0

// loop: i -> n-1 => find sum(n[j] + n[k]) = -n[i]
// the best way is sort the nums first,
// then find the j and k from i+1 -> n-1 by using two pointer
// because the order doesn't matter, so sort is faster and simpler than using hashmap
//
// how to avoid duplicates?
// one rule for all three branches: a pointer that moves skips the whole run of
// equal values, so the same (left, right) value pair is never evaluated twice.
// equal values give an equal sum -- that is why the rule is safe, and also why
// it means two different things depending on the branch:
//   sum == 0      -> required. the duplicate pair would re-add an identical triplet
//   sum > 0 / < 0 -> optional, pure speed. nothing is recorded in those branches

// 56ms - beats 59%
class Solution {
  List<List<int>> threeSum(List<int> nums) {
    // let's sort the input first
    nums.sort();

    // handle edge case, when the min i > 0, or max is < 0, so no way sum n[i] + n[j] + n[k] = 0
    if (nums[0] > 0 || nums.last < 0) return [];

    final result = <List<int>>[];

    // how to avoid duplicates?
    for (var i = 0; i < nums.length - 2; i++) {
      var left = i + 1, right = nums.length - 1;

      // print(nums.sublist(i, nums.length-1));

      while (left < right) {
        final sum = nums[i] + nums[left] + nums[right];

        // if sum = 0 it means i, j, k is valid
        if (sum == 0) {
          result.add([nums[i], nums[left], nums[right]]);

          // avoid dup left -- required, not just speed
          while (left < right && nums[left + 1] == nums[left]) {
            left++;
          }

          // avoid dup right -- required, not just speed
          while (right > left && nums[right - 1] == nums[right]) {
            right--;
          }

          // we find the couple left + right = reciprocal(n[i])
          // so we can move both pointer to reduce the window size
          // because each couple is unique
          left++;
          right--;
        } else if (sum > 0) {
          // avoid dup right -- optional, pure speed
          while (right > left && nums[right - 1] == nums[right]) {
            right--;
          }

          // because the sum > 0, so we move right to reduce the sum value
          right--;
        } else {
          // avoid dup left -- optional, pure speed
          while (left < right && nums[left + 1] == nums[left]) {
            left++;
          }

          // because the sum < 0, so we move left to reduce the sum value
          left++;
        }
      }

      // avoid dup nums[i] -- required, same reason as sum == 0
      while (i < nums.length - 3 && nums[i + 1] == nums[i]) {
        i++;
      }
    }

    return result;
  }
}
