// 6
// ms
// Beats
// 69.57%

class Solution {
  List<int> intersection(List<int> nums1, List<int> nums2) {
    final s1 = <int>{};

    for (final e in nums1) {
      s1.add(e);
    }

    final r = <int>{};

    for (final e in nums2) {
      if (s1.contains(e)) r.add(e);
    }

    return r.toList();
  }
}
