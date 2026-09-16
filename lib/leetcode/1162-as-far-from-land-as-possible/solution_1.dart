import 'dart:math';

// 13
// ms
// Beats
// 100.00%

class Solution {
  int maxDistance(List<List<int>> grid) {
    final r = grid.length, c = grid.first.length;
    final area = r * c;

    final queue = RingQueue<(int, int, int)>(area);

    var longest = -1;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (grid[i][j] == 1) {
          grid[i][j] = -1;
          queue.add((i, j, 0));
        }
      }
    }

    bool add_2_queue(int i, int j, int len) {
      if (i < 0 || i == r || j < 0 || j == c) return false;

      if (grid[i][j] != 0) return false;

      grid[i][j] = len;
      queue.add((i, j, len));

      return true;
    }

    while (queue.isNotEmpty) {
      var (i, j, len) = queue.removeFirst();

      len++;

      var find = add_2_queue(i, j - 1, len);
      find |= add_2_queue(i - 1, j, len);
      find |= add_2_queue(i, j + 1, len);
      find |= add_2_queue(i + 1, j, len);

      if (find) longest = max(longest, len);
    }

    return longest;
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
  Solution().maxDistance([
    [1, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ]);
}
