// 20
// ms
// Beats
// 87.88%

class MinStack {
  MinStack() {}

  final stack = <int>[];
  final min_stack = <int>[];

  void push(int value) {
    stack.add(value);

    if (min_stack.isEmpty) {
      min_stack.add(value);
    } else {
      if (value <= min_stack.last) min_stack.add(value);
    }
  }

  void pop() {
    if (min_stack.last == stack.removeLast()) min_stack.removeLast();
  }

  int top() {
    return stack.last;
  }

  int getMin() {
    return min_stack.last;
  }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = MinStack();
 * obj.push(value);
 * obj.pop();
 * int param3 = obj.top();
 * int param4 = obj.getMin();
 */
