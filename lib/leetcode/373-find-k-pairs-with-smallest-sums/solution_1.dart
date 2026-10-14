import 'package:collection/collection.dart';

// 104
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> kSmallestPairs(List<int> nums1, List<int> nums2, int k) {
    final result = <List<int>>[];
    final len = nums2.length - 1;

    final heap = HeapPriorityQueue<(int, int, int, int)>((a, b) => a.$4.compareTo(b.$4))
      ..addAll(nums1.map((n1) => (n1, nums2[0], 0, n1 + nums2[0])));

    while (result.length < k) {
      var (n1, n2, i, _) = heap.removeFirst();
      result.add([n1, n2]);
      if (i++ < len) {
        heap.add((n1, nums2[i], i, n1 + nums2[i]));
      }
    }

    return result;
  }
}
