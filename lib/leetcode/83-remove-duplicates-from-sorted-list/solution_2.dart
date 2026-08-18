class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

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
