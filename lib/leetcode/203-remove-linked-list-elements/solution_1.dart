class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// 1
// ms
// Beats
// 71.43%

class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    while (head?.val == val) {
      head = head?.next;
    }

    if (head == null) return null;

    final root = head;

    while (head != null) {
      while (head.next?.val == val) {
        head.next = head.next?.next;
      }

      head = head.next;
    }

    return root;
  }
}
