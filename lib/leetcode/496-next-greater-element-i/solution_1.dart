import 'package:collection/collection.dart';
// 6
// ms
// Beats
// 66.67%

class Solution {
  List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
    final map = <int, int>{};
    for (var i = 0; i < nums1.length; i++) {
      map[nums1[i]] = i;
    }
    final result = List.filled(nums1.length, -1);
    final stack = QueueList(nums2.length);
    for (var j = nums2.length - 1; j >= 0; j--) {
      final val = nums2[j];
      final i = map[val];
      if (i != null) {
        // print((val, stack));

        for (var j1 = stack.length - 1; j1 >= 0; j1--) {
          if (stack[j1] > val) {
            result[i] = stack[j1];
            break;
          }
        }
      }
      while (stack.isNotEmpty && stack.last < val) stack.removeLast();
      stack.add(val);
    }
    return result;
  }
}

void main(List<String> args) {
  print(Solution().nextGreaterElement([4, 1, 2], [1, 3, 4, 2]));
}
