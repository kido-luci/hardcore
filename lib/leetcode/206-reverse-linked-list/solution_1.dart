import 'package:hardcore/model/linked_list.dart';

// 0 ms
// Beats
// 100.00%

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? revertNode;

    while (head != null) {
      revertNode = ListNode(head.val, revertNode);
      head = head.next;
    }

    return revertNode;
  }
}
