// 361
// ms
// Beats
// 61.90%

class Solution {
  int removeDuplicates(List<int> nums) {
    int take = 1;
    var lastSet_index = 0;

    for (var i = 1; i < nums.length; i++) {
      if (nums[lastSet_index] != nums[i]) {
        take = 1;
        nums[++lastSet_index] = nums[i];
      } else if (take < 2) {
        take++;
        nums[++lastSet_index] = nums[i];
      }
    }

    return lastSet_index + 1;
  }
}

void main() {
  print(Solution().removeDuplicates([1, 1, 1, 2, 2, 3]));
  print(Solution().removeDuplicates([0, 0, 1, 1, 1, 1, 2, 3, 3]));
}
