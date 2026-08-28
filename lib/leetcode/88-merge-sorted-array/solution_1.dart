// 0
// ms
// Beats
// 100.00%

class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    for (var i = m + n - 1; i >= 0; i--) {
      if (n == 0) return;

      if (m == 0) {
        nums1[i] = nums2[--n];
        continue;
      }

      // print((m, n));

      if (nums1[m - 1] >= nums2[n - 1]) {
        nums1[i] = nums1[--m];
      } else {
        nums1[i] = nums2[--n];
      }
    }
  }
}

void main() {
  final result = [4, 5, 6, 0, 0, 0];

  Solution().merge(result, 3, [1, 2, 3], 3);

  print(result);
}
