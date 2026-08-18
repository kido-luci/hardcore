// 0
// ms
// Beats
// 100.00%
class MyQueue {
  final _stack = <int>[];

  MyQueue() {}

  void push(int x) {
    _stack.add(x);
  }

  int pop() {
    final revertStack = <int>[];

    while (_stack.isNotEmpty) {
      revertStack.add(_stack.removeLast());
    }

    final result = revertStack.removeLast();

    while (revertStack.isNotEmpty) {
      _stack.add(revertStack.removeLast());
    }

    return result;
  }

  int peek() {
    final revertStack = <int>[];

    while (_stack.isNotEmpty) {
      revertStack.add(_stack.removeLast());
    }

    final result = revertStack.last;

    while (revertStack.isNotEmpty) {
      _stack.add(revertStack.removeLast());
    }

    return result;
  }

  bool empty() {
    return _stack.isEmpty;
  }
}
