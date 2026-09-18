import 'dart:typed_data';

// 78
// ms
// Beats
// 100.00%

class Solution {
  List<int> survivedRobotsHealths(List<int> positions, List<int> healths, String directions) {
    final len = positions.length;

    final robots = List<(int, int)>.generate(len, (i) => (positions[i], i))
      ..sort((a, b) => a.$1.compareTo(b.$1));

    // print(robots);

    final stack = IntStack(len);

    for (final (_, i) in robots) {
      if (directions[i] == 'L') {
        while (stack.isNotEmpty) {
          var (s_i) = stack.last;

          if (directions[s_i] == 'L') break;

          if (healths[i] < healths[s_i]) {
            healths[i] = 0;
            stack.pop();
            if (--healths[s_i] > 0) stack.push((s_i));
            break;
          } else if (healths[i] > healths[s_i]) {
            stack.pop();
            healths[s_i] = 0;
            if (--healths[i] == 0) break;
          } else {
            healths[i] = 0;
            healths[s_i] = 0;
            stack.pop();
            break;
          }
        }

        if (healths[i] > 0) stack.push((i));
      } else
        stack.push((i));
    }

    // print(healths);

    final result = IntStack(stack.length);

    for (final e in healths) if (e > 0) result.push(e);

    return result.toList();
  }
}

class IntStack {
  final Int32List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Int32List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

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
  /// The copy is an `Int32List`: one block copy, far cheaper than building a
  /// `List<int>` item by item, but fixed-length (`add` throws) and truncating
  /// anything stored into it to 32 bits.
  List<int> toList() => _buf.sublist(0, _length);
}

void main(List<String> args) {
  print(Solution().survivedRobotsHealths([3, 5, 2, 6], [10, 10, 15, 12], "RLRL"));
}
