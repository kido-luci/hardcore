class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// 3
// ms
// Beats
// 90.00%

class Solution {
  ListNode? deleteMiddle(ListNode? head) {
    if (head == null || head.next == null) return null;

    final root = head;
    ListNode? center = head;
    head = head.next?.next;

    while (head != null) {
      if (head.next != null) {
        center = center?.next;
      }

      head = head.next?.next;

      print((head?.val, center?.val));
    }

    center?.next = center.next?.next;

    return root;
  }
}
