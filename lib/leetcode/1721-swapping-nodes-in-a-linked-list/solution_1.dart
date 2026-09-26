import 'package:hardcore/model/linked_list.dart';

// 1
// ms
// Beats
// 100.00%

class Solution {
  ListNode? swapNodes(ListNode? head, int k) {
    if (head == null || head.next == null) return head;

    ListNode? clone = head;

    late ListNode first;
    ListNode sec = clone;

    int count = 0;

    while (clone != null) {
      count++;

      if (count > k) {
        sec = sec.next!;
      } else if (count == k)
        first = clone;

      clone = clone.next;
    }

    final tmp = first.val;
    first.val = sec.val;
    sec.val = tmp;

    return head;
  }
}

void main(List<String> args) {
  // print(Solution().swapNodes(ListNode.fromList([1, 2, 3, 4, 5]), 2));
  print(Solution().swapNodes(ListNode.fromList([7, 9, 6, 6, 7, 8, 3, 0, 9, 5]), 5));
}
