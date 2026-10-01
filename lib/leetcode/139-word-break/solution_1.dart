// 7
// ms
// Beats
// 100.00%

import 'dart:math';

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    final longest_word = wordDict.fold(0, (s, e) => max(s, e.length));

    final s_len = s.length;

    final set = wordDict.toSet();

    final mem = <int, int>{};

    int get_ways(int start) {
      var next = mem[start] ?? start;

      if (next == -1) return -1;

      next++;

      while (next <= s_len && next - start <= longest_word) {
        if (set.contains(s.substring(start, next))) return mem[start] = next;
        next++;
      }

      return mem[start] = -1;
    }

    bool dfs(int start) {
      if (start == s_len) return true;

      int next = get_ways(start);

      while (next != -1) {
        if (dfs(next)) return true;
        next = get_ways(start);
      }

      return false;
    }

    return dfs(0);
  }
}

// 21
// ms
// Beats
// 25.00%
// class Solution {
//   bool wordBreak(String s, List<String> wordDict) {
//     final s_len = s.length;

//     final set = wordDict.toSet();

//     final mem = <int, IntStack>{};

//     IntStack get_ways(int start) {
//       if (mem[start] != null) return mem[start]!;

//       final ways = IntStack(s_len);

//       for (var end = start + 1; end <= s_len; end++) {
//         if (set.contains(s.substring(start, end))) ways.push(end);
//       }

//       return mem[start] = ways;
//     }

//     bool dfs(int start) {
//       if (start == s_len) return true;

//       final ways = get_ways(start);

//       while (ways.isNotEmpty) {
//         if (dfs(ways.pop())) return true;
//       }

//       return false;
//     }

//     return dfs(0);
//   }
// }

// class IntStack {
//   final Int32List _buf;
//   int _length = 0;

//   IntStack(int capacity) : _buf = Int32List(capacity);

//   bool get isEmpty => _length == 0;

//   bool get isNotEmpty => _length != 0;

//   int get length => _length;

//   /// The backing buffer itself — no copy — at the capacity given to the
//   /// constructor, not at [length]. Slots from [length] on hold whatever was
//   /// last there. Meant for the end of a solve, once nothing will push or pop
//   /// again: writing to it writes to the stack.
//   Int32List get all => _buf;

//   /// The top of the stack, without removing it.
//   int get last => _buf[_length - 1];

//   void push(int value) => _buf[_length++] = value;

//   int pop() => _buf[--_length];

//   /// Drops the top [count] items without reading them.
//   ///
//   /// Note this is not `List.removeRange`, which takes a start and an end. Here
//   /// there is one argument and it is a count, taken off the top — `pop` for
//   /// several items at once. Like [pop], it does not check that there are that
//   /// many to drop.
//   void removeRange(int count) => _length -= count;

//   /// Drops every item. Keeps the buffer, so reusing one stack across many
//   /// traversals costs no further allocation.
//   void clear() => _length = 0;

//   /// The items bottom to top, as a new list — the same order `List<int>` would
//   /// hold them in if it had been used as the stack. Changing the returned list
//   /// does not change the stack.
//   ///
//   /// The copy is an `Int32List`: one block copy, far cheaper than building a
//   /// `List<int>` item by item, but fixed-length (`add` throws) and truncating
//   /// anything stored into it to 32 bits.
//   List<int> toList() => _buf.sublist(0, _length);
// }
