import 'dart:typed_data';

// 18
// ms
// Beats
// 100.00%

class Solution {
  int countCollisions(String directions) {
    int count = 0;

    final len = directions.length;

    const k_s = 83;
    const k_l = 76;
    const k_r = 82;

    final stack = IntStack(len);

    for (final e in directions.codeUnits) {
      switch (e) {
        case k_s:
          while (stack.isNotEmpty) {
            if (stack.pop() == k_r) count++;
          }

          stack.push(k_s);

        case k_l:
          if (stack.isEmpty) continue;

          if (stack.last == k_s) {
            count++;
          } else {
            count += 2;
            stack.pop();

            while (stack.isNotEmpty) {
              stack.pop();
              count++;
            }

            stack.push(k_s);
          }

        default:
          if (stack.isNotEmpty && stack.last == k_s) stack.pop();

          stack.push(k_r);
      }
    }

    return count;
  }
}

class IntStack {
  final Uint8List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Uint8List(capacity);

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

// void main(List<String> args) {
//   // print(Solution())
//   print('S'.codeUnits[0]);
//   print('L'.codeUnits[0]);
//   print('R'.codeUnits[0]);
// }
