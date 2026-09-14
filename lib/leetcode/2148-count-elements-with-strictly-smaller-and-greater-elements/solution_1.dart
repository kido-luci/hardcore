// 5
// ms
// Beats
// 100.00%

class Solution {
  int countElements(List<int> nums) {
    nums.sort();

    var l = 0, r = nums.length - 1;

    if (nums[l] == nums[r]) return 0;

    var s = 0;

    while (l <= r) {
      final m = (r - l) ~/ 2 + l;

      if (nums[m] > nums[0]) {
        if (nums[m - 1] == nums[0]) {
          s = m;
          break;
        }

        r = m - 1;
      } else {
        if (nums[m + 1] > nums[0]) {
          s = m + 1;
          break;
        }

        l = m + 1;
      }
    }

    if (s == nums.length - 1) return 0;

    l = s;
    r = nums.length - 1;

    var e = 0;

    while (l <= r) {
      final m = (r - l) ~/ 2 + l;

      if (nums[m] < nums.last) {
        if (nums[m + 1] == nums.last) {
          e = m;
          break;
        }

        l = m + 1;
      } else {
        if (nums[m - 1] < nums.last) {
          e = m - 1;
          break;
        }

        r = m - 1;
      }
    }

    return e - s + 1;
  }
}
