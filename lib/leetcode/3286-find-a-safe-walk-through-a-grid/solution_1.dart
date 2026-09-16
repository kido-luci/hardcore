// 53
// ms
// Beats
// 100.00%

class Solution {
  bool findSafeWalk(List<List<int>> grid, int health) {
    health--;

    // for (final e in grid) {
    //   print(e);
    // }

    // print('------');

    final r = grid.length, c = grid.first.length;

    final queue = RingQueue<(int, int, int)>(r * c * (health + 1));

    bool add_2_queue(int i, int j, int remain) {
      if (i < 0 || i == r || j < 0 || j == c) return false;

      final val = grid[i][j];

      if (i == r - 1 && j == c - 1) return val == 0 || remain > 0;

      switch (val) {
        case 1:
          if (--remain < 0) return false;

          grid[i][j] = -remain - 1;
          queue.add((i, j, remain));
          break;
        case 0:
          grid[i][j] = remain + 2;
          queue.add((i, j, remain));
          break;
        default:
          if (val > 0) {
            if (remain > val - 2) {
              grid[i][j] = remain + 2;
              queue.add((i, j, remain));
            }
          } else {
            if (--remain > -(val + 1)) {
              grid[i][j] = -remain - 1;
              queue.add((i, j, remain));
            }
          }
      }

      // print(-remain - 1);

      return false;
    }

    if (add_2_queue(0, 0, health)) return true;

    while (queue.isNotEmpty) {
      var (i, j, remain) = queue.removeFirst();

      if (add_2_queue(i, j + 1, remain) ||
          add_2_queue(i + 1, j, remain) ||
          add_2_queue(i - 1, j, remain) ||
          add_2_queue(i, j - 1, remain)) {
        // for (final e in grid) {
        //   print(e);
        // }

        // print(len);

        return true;
      }
    }

    // for (final e in grid) {
    //   print(e);
    // }

    return false;
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
