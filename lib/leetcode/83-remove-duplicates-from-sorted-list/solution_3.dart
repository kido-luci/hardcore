import 'package:hardcore/model/linked_list.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return null;

    final newHead = ListNode(head.val);
    var current = newHead;

    head = head.next;

    while (head != null) {
      if (head.val != current.val) {
        current = (current.next = ListNode(head.val));
      }

      head = head.next;
    }

    return newHead;
  }
}
