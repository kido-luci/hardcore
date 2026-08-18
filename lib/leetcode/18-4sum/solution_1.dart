class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    nums.sort();

    final len = nums.length;

    final results = <List<int>>[];

    var nums_a = 0, nums_b = 0;
    var a = 0, b = 0, left = 0, right = 0;

    for (a = 0; a < len - 3; a++) {
      nums_a = nums[a];

      for (b = a + 1; b < len - 2; b++) {
        nums_b = nums[b];

        left = b + 1;
        right = len - 1;

        while (right > left) {
          final sum = nums_a + nums_b + nums[left] + nums[right];

          if (sum == target) {
            results.add([nums_a, nums_b, nums[left], nums[right]]);

            while (right > left && nums[left + 1] == nums[left]) {
              left++;
            }

            while (right > left && nums[right - 1] == nums[right]) {
              right--;
            }

            right--;
            left++;
          } else if (sum > target) {
            right--;
          } else {
            left++;
          }
        }

        while (b < len - 2 && nums[b + 1] == nums_b) {
          b++;
        }
      }

      while (a < len - 3 && nums[a + 1] == nums_a) {
        a++;
      }
    }

    return results;
  }
}
