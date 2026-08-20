// * Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

// 11
// ms
// Beats
// 25.00%

class Solution {
  bool isPalindrome(ListNode? head) {
    final list = <int>[];

    while (head != null) {
      list.add(head.val);
      head = head.next;
    }

    var i = 0, j = list.length - 1;

    while (i < j) {
      if (list[i] != list[j]) {
        return false;
      }

      i++;
      j--;
    }

    return true;
  }
}

// Follow up: Could you do it in O(n) time and O(1) space? => pending
