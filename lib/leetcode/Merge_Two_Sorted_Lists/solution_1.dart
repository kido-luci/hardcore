import 'package:hardcore/model/linked_list.dart';

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    var list = list1;

    ListNode? result;
    late ListNode lastNode;

    void addNode(int value) {
      if (result == null) {
        // when root is null
        result = lastNode = ListNode(value);
      } else {
        // add to next
        lastNode.next = ListNode(value);
        lastNode = lastNode.next!;
      }
    }

    // take until the current node <= max
    ListNode? takeUntil(ListNode? tmpList, int? max) {
      if (max == null) return tmpList;

      while (tmpList != null && tmpList.val <= max) {
        addNode(tmpList.val);
        tmpList = tmpList.next;
      }

      return tmpList;
    }

    if (list == null) {
      if (list2 == null) {
        return null;
      }

      list = list2;
      list2 = null;
    } else {
      // handle start of n node of list2 < list1
      list2 = takeUntil(list2, list.val);
    }

    while (list != null) {
      addNode(list.val);
      list2 = takeUntil(list2, list.next?.val);

      // move next
      list = list.next;

      if (list == null && list2 != null) {
        // take the remain of lis2
        list = list2;
        list2 = null;
      }
    }

    return result;
  }
}
