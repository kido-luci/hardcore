import 'package:hardcore/model/linked_list.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) return head;

    final root = head.next;

    head.next = swapPairs(head.next?.next);

    root!.next = head;

    return root;
  }
}
