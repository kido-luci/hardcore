class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// 59
// ms
// Beats
// -%
class Solution {
  ListNode? modifiedList(List<int> nums, ListNode? head) {
    final set = nums.toSet();

    while (set.contains(head?.val)) {
      head = head?.next;
    }

    if (head == null) return null;

    final root = head;

    while (head != null) {
      while (set.contains(head.next?.val)) {
        head.next = head.next?.next;
      }

      head = head.next;
    }

    return root;
  }
}
