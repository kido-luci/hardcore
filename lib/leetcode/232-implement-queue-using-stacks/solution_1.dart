class MyQueue {
  final _stack = <int>[];

  MyQueue() {}

  void push(int x) {
    _stack.add(x);
  }

  int pop() {
    return _stack.removeAt(0);
  }

  int peek() {
    return _stack[0];
  }

  bool empty() {
    return _stack.isEmpty;
  }
}
