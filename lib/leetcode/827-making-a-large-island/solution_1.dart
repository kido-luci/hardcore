import 'dart:math';
import 'dart:typed_data';

// 136
// ms
// Beats
// 100.00%

class Solution {
  int largestIsland(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;

    int largest = 0;

    final len = r * c;

    final stack_i = IntStack(len);
    final stack_j = IntStack(len);

    int island_key = 2;
    int island_size = 0;

    void add_2_q(int i, int j) {
      grid[i][j] = island_key;
      stack_i.push(i);
      stack_j.push(j);

      island_size++;
    }

    void check(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (grid[i][j] != 1) return;

      add_2_q(i, j);
    }

    final island_sizes = <int>[];

    (int, int) add_island(int i, int j) {
      island_size = 0;

      add_2_q(i, j);

      while (stack_j.isNotEmpty) {
        final i_1 = stack_i.pop();
        final j_1 = stack_j.pop();

        check(i_1 - 1, j_1);
        check(i_1, j_1 - 1);
        check(i_1 + 1, j_1);
        check(i_1, j_1 + 1);
      }

      island_sizes.add(island_size);
      largest = max(largest, island_size);

      return (island_key++, island_size);
    }

    (int, int) try_connect(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return (0, 0);

      final val = grid[i][j];

      switch (val) {
        case 0:
          return (0, 0);
        case 1:
          return add_island(i, j);
        default:
          return (val, island_sizes[val - 2]);
      }
    }

    final results = List.filled(4, (0, 0));

    final connected = <int>{};

    void connect(int i, int j) {
      int connect_area = 1;

      connected.clear();

      results[0] = try_connect(i - 1, j);
      results[1] = try_connect(i, j - 1);
      results[2] = try_connect(i + 1, j);
      results[3] = try_connect(i, j + 1);

      for (final (key, area) in results) {
        if (connected.add(key)) connect_area += area;
      }

      largest = max(largest, connect_area);
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        switch (grid[i][j]) {
          case 1:
            add_island(i, j);
            break;
          case 0:
            connect(i, j);
            break;
        }
      }
    }

    return largest;
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

void main(List<String> args) {
  print(
    Solution().largestIsland([
      [1, 0],
      [0, 1],
    ]),
  );

  print(
    Solution().largestIsland([
      [0, 0],
      [0, 0],
    ]),
  );
}
