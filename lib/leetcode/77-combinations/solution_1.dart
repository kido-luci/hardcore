import 'dart:typed_data';

// 13
// ms
// Beats
// 100.00%
class Solution {
  List<List<int>> combine(int n, int k) {
    final result = <List<int>>[];
    final can = IntStack(k);

    void dfs(int start) {
      if (can.length == k) {
        result.add(can.toList());
        return;
      }

      for (var i = start; i <= n - (k - can.length) + 1; i++) {
        can.push(i);
        dfs(i + 1);
        can.pop();
      }
    }

    dfs(1);

    return result;
  }
}

class IntStack {
  final Uint8List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Uint8List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The backing buffer itself — no copy — at the capacity given to the
  /// constructor, not at [length]. Slots from [length] on hold whatever was
  /// last there. Meant for the end of a solve, once nothing will push or pop
  /// again: writing to it writes to the stack.
  Uint8List get all => _buf;

  /// The top of the stack, without removing it.
  int get last => _buf[_length - 1];

  void push(int value) => _buf[_length++] = value;

  int pop() => _buf[--_length];

  /// Drops the top [count] items without reading them.
  ///
  /// Note this is not `List.removeRange`, which takes a start and an end. Here
  /// there is one argument and it is a count, taken off the top — `pop` for
  /// several items at once. Like [pop], it does not check that there are that
  /// many to drop.
  void removeRange(int count) => _length -= count;

  /// Drops every item. Keeps the buffer, so reusing one stack across many
  /// traversals costs no further allocation.
  void clear() => _length = 0;

  /// The items bottom to top, as a new list — the same order `List<int>` would
  /// hold them in if it had been used as the stack. Changing the returned list
  /// does not change the stack.
  ///
  /// The copy is an `Uint8List`: one block copy, far cheaper than building a
  /// `List<int>` item by item, but fixed-length (`add` throws) and truncating
  /// anything stored into it to 32 bits.
  List<int> toList() => _buf.sublist(0, _length);
}

void main(List<String> args) {
  print(Solution().combine(4, 2));
}
