//Definition for singly-linked list.

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  static ListNode? formList(List<int> iterable) {
    ListNode? current;

    for (var i = iterable.length - 1; i >= 0; i--) {
      final newE = ListNode(iterable[i], current);
      current = newE;
    }

    return current;
  }

  @override
  String toString() {
    final sb = StringBuffer();

    ListNode? current = this;

    do {
      sb.write('${current!.val}, ');
      current = current.next;
    } while (current != null);

    return sb.toString();
  }
}

void main() {
  print(ListNode.formList([1, 2, 3, 4, 5]));
  print(ListNode.formList([5, 4, 3, 2, 1]));
}
