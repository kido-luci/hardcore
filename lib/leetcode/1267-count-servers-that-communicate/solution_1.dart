import 'dart:typed_data';

// 3
// ms
// Beats
// 100.00%

class Solution {
  int countServers(List<List<int>> grid) {
    if (grid.isEmpty) return 0;

    final r = grid.length;
    final c = grid.first.length;

    int count = 0;

    final queue = IntQueue(r);

    for (var i = 0; i < r; i++) {
      bool have_e = false;

      for (var j = 0; j < c; j++) {
        switch (grid[i][j]) {
          case 1:
            grid[i][j] = 2;
            queue.add(j);
          case 2:
            have_e = true;
        }
      }

      final q_len = queue.length;

      final current_count = count;

      while (queue.isNotEmpty) {
        final j = queue.removeFirst();

        for (var tmp_i = i + 1; tmp_i < r; tmp_i++) {
          if (grid[tmp_i][j] == 1) {
            count++;
            grid[tmp_i][j] = 2;
          }
        }
      }

      if (q_len > 1 || have_e || current_count < count) count += q_len;
    }

    return count;
  }
}

class IntQueue {
  final Int32List _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  IntQueue(int capacity) : _capacity = capacity, _buf = Int32List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The front of the queue, without removing it.
  int get first => _buf[_head];

  void add(int value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  int removeFirst() {
    final value = _buf[_head];

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
  }

  void clear() {
    _head = 0;
    _length = 0;
  }
}

void main(List<String> args) {
  print(
    Solution().countServers([
      [1, 1, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 1],
    ]),
  );
}
