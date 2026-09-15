// 13
// ms
// Beats
// 100.00%

class Solution {
  int shortestBridge(List<List<int>> grid) {
    final r = grid.length, c = grid.first.length;
    final area = r * c;

    final queue = RingQueue<(int, int, int)>(area);

    for (var i = 0; i < r; i++) {
      bool find = false;

      for (var j = 0; j < c; j++) {
        if (grid[i][j] == 1) {
          find = true;

          final tmp_queue = RingQueue<(int, int)>(area);

          queue.add((i, j, 0));
          tmp_queue.add((i, j));
          grid[i][j] = 2;

          void add_2_tmp_queue(int i, int j) {
            if (i < 0 || i == r || j < 0 || j == c) return;
            if (grid[i][j] != 1) return;

            grid[i][j] = 2;

            queue.add((i, j, 0));
            tmp_queue.add((i, j));
          }

          while (tmp_queue.isNotEmpty) {
            final (i, j) = tmp_queue.removeFirst();

            add_2_tmp_queue(i, j - 1);
            add_2_tmp_queue(i - 1, j);
            add_2_tmp_queue(i, j + 1);
            add_2_tmp_queue(i + 1, j);
          }

          break;
        }
      }

      if (find) break;
    }

    // for (final e in grid) print(e);

    bool add_2_queue(int i, int j, int len) {
      if (i < 0 || i == r || j < 0 || j == c) return false;

      switch (grid[i][j]) {
        case 1:
          return true;
        case 0:
          grid[i][j] = 2;
          queue.add((i, j, len));
          return false;
        default:
          return false;
      }
    }

    while (queue.isNotEmpty) {
      var (i, j, len) = queue.removeFirst();

      len++;

      if (add_2_queue(i, j - 1, len) ||
          // add_2_queue(i - 1, j - 1, len) ||
          add_2_queue(i - 1, j, len) ||
          // add_2_queue(i - 1, j + 1, len) ||
          add_2_queue(i, j + 1, len) ||
          // add_2_queue(i + 1, j + 1, len) ||
          add_2_queue(i + 1, j, len)
      // || add_2_queue(i + 1, j - 1, len)
      )
        return len - 1;
    }

    return -1;
  }
}

class RingQueue<T> {
  final List<T?> _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  RingQueue(int capacity)
    : _capacity = capacity,
      _buf = List<T?>.filled(capacity, null);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The front of the queue, without removing it.
  T get first => _buf[_head] as T;

  void add(T value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  T removeFirst() {
    final value = _buf[_head] as T;

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
  }

  void clear() {
    _head = 0;
    _length = 0;
  }

  /// Front to back, in the same `{a, b, c}` format as `dart:collection`'s
  /// `Queue`, so the two print identically when you swap one for the other.
  @override
  String toString() {
    final sb = StringBuffer('{');

    for (var n = 0; n < _length; n++) {
      var index = _head + n;
      if (index >= _capacity) index -= _capacity;

      if (n > 0) sb.write(', ');
      sb.write(_buf[index]);
    }

    sb.write('}');

    return sb.toString();
  }
}

void main(List<String> args) {
  print(
    Solution().shortestBridge([
      [0, 1, 0],
      [0, 0, 0],
      [0, 0, 1],
    ]),
  );
}
