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
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    if (head == null) return null;

    final len = countLen(head);

    if (n == len) return head.next;

    removeNthFromStart(head, len - n, 1);

    return head;
  }

  int countLen(ListNode? head) {
    if (head == null) return 0;

    return 1 + countLen(head.next);
  }

  void removeNthFromStart(ListNode? head, int n, int count) {
    print((head?.val, n, count));

    if (count == n) {
      head?.next = head.next?.next;
      return;
    } else {
      removeNthFromStart(head?.next, n, count + 1);
    }
  }
}
