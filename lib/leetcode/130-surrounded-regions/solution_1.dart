import 'dart:typed_data';

// 5
// ms
// Beats
// 20.00%
class Solution {
  void solve(List<List<String>> board) {
    final r = board.length;
    final c = board.first.length;
    final len = r * c;

    final stack_i = IntStack(len);
    final stack_j = IntStack(len);

    final revert_stack_i = IntStack(len);
    final revert_stack_j = IntStack(len);

    int current_size = 0;

    void add_2_stack(int i, int j) {
      board[i][j] = 'X';
      stack_i.push(i);
      stack_j.push(j);

      revert_stack_i.push(i);
      revert_stack_j.push(j);

      current_size++;
    }

    bool can_replace(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      if (board[i][j] != 'O') return true;

      add_2_stack(i, j);

      return true;
    }

    void check_island(int i, int j) {
      current_size = 0;

      add_2_stack(i, j);

      bool surrounded = true;

      while (stack_j.isNotEmpty) {
        final i_1 = stack_i.pop();
        final j_1 = stack_j.pop();

        surrounded &= can_replace(i_1 - 1, j_1);
        surrounded &= can_replace(i_1, j_1 - 1);
        surrounded &= can_replace(i_1 + 1, j_1);
        surrounded &= can_replace(i_1, j_1 + 1);
      }

      if (surrounded) {
        revert_stack_i.removeRange(current_size);
        revert_stack_j.removeRange(current_size);
      }
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (board[i][j] == 'O') {
          check_island(i, j);
        }
      }
    }

    while (revert_stack_i.isNotEmpty) {
      final i = revert_stack_i.pop();
      final j = revert_stack_j.pop();

      board[i][j] = 'O';
    }
  }
}

class IntStack {
  final Uint16List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Uint16List(capacity);

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
}
