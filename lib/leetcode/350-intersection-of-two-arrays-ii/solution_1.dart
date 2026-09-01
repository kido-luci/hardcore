// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> intersect(List<int> nums1, List<int> nums2) {
    final n1_c = List.filled(1001, 0);
    for (final e in nums1) {
      n1_c[e]++;
    }

    final r = <int>[];

    for (final e in nums2) {
      if (n1_c[e] > 0) {
        r.add(e);
        n1_c[e]--;
      }
    }

    return r;
  }
}
