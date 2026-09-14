import 'dart:typed_data';

// 3
// ms
// Beats
// 100.00%

class Solution {
  int closedIsland(List<List<int>> grid) {
    int closed = 0;

    final r = grid.length;
    final c = grid.first.length;
    final len = r * c;

    final stack_i = IntStack(len);
    final stack_j = IntStack(len);

    int island_key = 2;

    void add_2_q(int i, int j) {
      grid[i][j] = island_key;
      stack_i.push(i);
      stack_j.push(j);
    }

    bool check(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      if (grid[i][j] != 0) return true;

      add_2_q(i, j);

      return true;
    }

    void check_island(int i, int j) {
      add_2_q(i, j);

      bool isclose = true;

      while (stack_j.isNotEmpty) {
        final i_1 = stack_i.pop();
        final j_1 = stack_j.pop();

        isclose &= check(i_1 - 1, j_1);
        isclose &= check(i_1, j_1 - 1);
        isclose &= check(i_1 + 1, j_1);
        isclose &= check(i_1, j_1 + 1);
      }

      if (isclose) closed++;
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        switch (grid[i][j]) {
          case 0:
            check_island(i, j);
            break;
        }
      }
    }

    return closed;
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

  /// Drops every item. Keeps the buffer, so reusing one stack across many
  /// traversals costs no further allocation.
  void clear() => _length = 0;
}
