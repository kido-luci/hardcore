// 20
// ms
// Beats
// 100.00%

class Solution {
  int shortestPathBinaryMatrix(List<List<int>> grid) {
    final r = grid.length, c = grid.first.length;
    final area = r * c;

    if (grid[0][0] != 0 || grid[r - 1][c - 1] != 0) return -1;

    final queue = RingQueue<(int, int, int)>(area);

    bool add_2_queue(int i, int j, int len) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      if (grid[i][j] == 1) return false;
      if (i == r - 1 && j == c - 1) return true;
      grid[i][j] = 1;
      queue.add((i, j, len));

      return false;
    }

    if (add_2_queue(0, 0, 1)) return 1;

    while (queue.isNotEmpty) {
      var (i, j, len) = queue.removeFirst();

      len++;

      if (add_2_queue(i, j - 1, len) ||
          add_2_queue(i - 1, j - 1, len) ||
          add_2_queue(i - 1, j, len) ||
          add_2_queue(i - 1, j + 1, len) ||
          add_2_queue(i, j + 1, len) ||
          add_2_queue(i + 1, j + 1, len) ||
          add_2_queue(i + 1, j, len) ||
          add_2_queue(i + 1, j - 1, len))
        return len;
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
