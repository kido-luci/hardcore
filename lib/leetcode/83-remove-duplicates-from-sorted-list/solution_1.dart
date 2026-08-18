class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// 1
// ms
// Beats
// 51.11%

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    int? last;

    ListNode? result;
    ListNode? current;

    while (head != null) {
      if (head.val != last) {
        last = head.val;

        if (result == null) {
          result = ListNode(last);
          current = result;
        } else {
          current = (current!.next = ListNode(last));
        }
      }

      head = head.next;
    }

    return result;
  }
}
