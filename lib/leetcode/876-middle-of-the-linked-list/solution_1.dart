import 'package:hardcore/model/linked_list.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  ListNode? middleNode(ListNode? head) {
    ListNode? mid = head;

    int move = 0;

    while (head != null) {
      head = head.next;

      if (move.isOdd) {
        mid = mid?.next;
      }

      move++;
    }

    return mid;
  }
}
