// [10,6,8,5,11,9]
// [10-(6-8-11)] - [11-10]
// [6-(8)]   - [11-6-8]
// [8-(5-11)] - [11-8]
// [5-(11)] - [11-5]
// [11-(9)] - [11]
// [9-(_)] - [9]
// 3-1-2-1-0

import 'dart:typed_data';

// 6
// ms
// Beats
// 100.00%

class Solution {
  List<int> canSeePersonsCount(List<int> heights) {
    final len = heights.length;
    final stack = IntStack(len);

    late int height;
    late int count;

    for (var j = len - 1; j >= 0; j--) {
      // print(stack.toList());

      height = heights[j];
      count = 0;

      while (stack.isNotEmpty && height > stack.last) {
        stack.pop();
        count++;
      }

      heights[j] = count + (stack.isNotEmpty ? 1 : 0);
      stack.push(height);
    }

    return heights;
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
  print(Solution().canSeePersonsCount([10, 6, 8, 5, 11, 9]));
}
