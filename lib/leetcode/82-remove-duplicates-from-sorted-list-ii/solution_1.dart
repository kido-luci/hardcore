import 'package:hardcore/model/linked_list.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null || head.next == null) return head;

    var pre = head.val - 1;

    while (head != null && (head.val == pre || head.val == head.next?.val)) {
      pre = head.val;
      head = head.next;
    }

    return head?..next = deleteDuplicates(head.next);
  }
}

void main(List<String> args) {
  print(Solution().deleteDuplicates(ListNode.fromList([1, 2, 3, 3, 4, 4, 5])));
}
