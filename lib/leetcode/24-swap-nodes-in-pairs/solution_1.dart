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
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) return head;

    final root = head.next;

    head.next = swapPairs(head.next?.next);

    root!.next = head;

    return root;
  }
}
