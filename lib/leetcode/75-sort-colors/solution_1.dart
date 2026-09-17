// 0
// ms
// Beats
// 100.00%

class Solution {
  void sortColors(List<int> nums) {
    final c = List.filled(3, 0);
    for (final e in nums) c[e]++;

    var i = 0;

    for (var j = 0; j < 3; j++) while (c[j]-- > 0) nums[i++] = j;
  }
}
