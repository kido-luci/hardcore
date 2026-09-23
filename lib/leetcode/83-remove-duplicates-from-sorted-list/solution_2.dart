import 'package:hardcore/model/linked_list.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? newHead;
    ListNode? current;

    while (head != null) {
      if (current == null) {
        newHead = ListNode(head.val);
        current = newHead;
      } else if (head.val != current.val) {
        current = (current.next = ListNode(head.val));
      }

      head = head.next;
    }

    return newHead;
  }
}
