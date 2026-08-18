// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

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
