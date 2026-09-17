// [3,5,-6,2,-1,4]
// 3 <= 3
// 3 5 <= 5
// -6  <= -6
//  -6 2 <= 2
// -6 2 <= -1
// -6 2 4 <= 4
//

import 'dart:typed_data';

// 5
// ms
// Beats
// 66.67%

class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    final stack = IntStack(asteroids.length);

    for (final e in asteroids) {
      if (e > 0) {
        stack.push(e);
      } else {
        final w = -e;

        while (stack.isNotEmpty && stack.last > 0 && stack.last < w) stack.pop();

        if (stack.isEmpty) {
          stack.push(e);
        } else {
          if (stack.last < w)
            stack.push(e);
          else if (stack.last == w)
            stack.pop();
        }
      }
    }

    return stack.toList();
  }
}

class IntStack {
  final Int16List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Int16List(capacity);

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
