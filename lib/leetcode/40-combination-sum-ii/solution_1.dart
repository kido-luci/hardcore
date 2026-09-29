import 'dart:typed_data';

// 8
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    final result = <List<int>>[];
    final cur = IntStack(candidates.length);
    var sum = 0;

    candidates.sort();

    void dfs(int start) {
      if (sum == target) {
        result.add(cur.toList());
        return;
      }

      for (var i = start; i < candidates.length; i++) {
        final val = candidates[i];
        if (i > start && val == candidates[i - 1]) continue;
        if (sum + val > target) continue;
        cur.push(val);
        sum += val;
        dfs(i + 1);
        cur.pop();
        sum -= val;
      }
    }

    dfs(0);

    return result;
  }
}

class IntStack {
  final Int32List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Int32List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The backing buffer itself — no copy — at the capacity given to the
  /// constructor, not at [length]. Slots from [length] on hold whatever was
  /// last there. Meant for the end of a solve, once nothing will push or pop
  /// again: writing to it writes to the stack.
  Int32List get all => _buf;

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
  print(Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
  print(Solution().combinationSum2([2, 5, 2, 1, 2], 5));
}
