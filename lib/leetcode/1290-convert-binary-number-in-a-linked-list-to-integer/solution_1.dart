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
  int getDecimalValue(ListNode? head) {
    int level = cal_level(head?.next);

    int result = 0;

    while (head != null) {
      result += head.val * level;
      level ~/= 2;
      head = head.next;
    }

    return result;
  }

  int cal_level(ListNode? head) {
    if (head == null) return 1;

    return 2 * cal_level(head.next);
  }
}
