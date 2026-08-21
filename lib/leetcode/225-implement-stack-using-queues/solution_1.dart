// 0
// ms
// Beats
// 100.00%

class MyStack {
  var queue = <int>[];

  MyStack() {}

  void push(int x) {
    queue.add(x);
  }

  int pop() {
    int len = queue.length;

    while (len > 0) {
      len--;

      final first = queue.removeAt(0);

      if (len > 0) {
        push(first);
      } else {
        return first;
      }
    }

    return 0;
  }

  int top() {
    int len = queue.length;

    int first = 0;

    while (len > 0) {
      len--;

      first = queue.removeAt(0);
      push(first);
    }

    return first;
  }

  bool empty() {
    return queue.firstOrNull == null;
  }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = MyStack();
 * obj.push(x);
 * int param2 = obj.pop();
 * int param3 = obj.top();
 * bool param4 = obj.empty();
 */
