import 'package:hardcore/model/linked_list.dart';

import 'solution_1.dart';

void main(List<String> args) {
  // Example 1:
  // Input: list1 = [1,2,4], list2 = [1,3,4]
  // Output: [1,1,2,3,4,4]
  check([1, 2, 4], [1, 3, 4], [1, 1, 2, 3, 4, 4]);

  // Example 2:
  // Input: list1 = [], list2 = []
  // Output: []
  check([], [], []);

  // Example 3:
  // Input: list1 = [], list2 = [0]
  // Output: [0]
  check([], [0], [0]);

  // Example 4:
  // Input: list1 = [1], list2 = [2]
  // Output: [1, 2]
  check([1], [2], [1, 2]);
}

ListNode? check(List<int> list1, List<int> list2, List<int> expect) {
  print('list1: $list1');
  print('list2: $list2');
  print('expect: $expect');

  final result = Solution().mergeTwoLists(
    ListNode.formList(list1),
    ListNode.formList(list2),
  );

  print('result: $result');
  print('***');

  return result;
}
