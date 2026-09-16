import 'dart:typed_data';

// 2
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> colorBorder(
    List<List<int>> grid,
    int row,
    int col,
    int color,
  ) {
    final r = grid.length, c = grid.first.length;
    final base_color = grid[row][col];
    final visted = List.generate(r, (_) => Uint8List(c));

    final queue = RingQueue<(int, int)>(r * c);
    final to_paint = RingQueue<(int, int)>(r * c);

    bool check(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      return grid[i][j] != base_color;
    }

    void handler(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (visted[i][j] == 1 || grid[i][j] != base_color) return;

      visted[i][j] = 1;

      if (i == 0 ||
          i == r - 1 ||
          j == 0 ||
          j == c - 1 ||
          check(i, j - 1) ||
          check(i - 1, j) ||
          check(i, j + 1) ||
          check(i + 1, j))
        to_paint.add((i, j));

      queue.add((i, j));
    }

    handler(row, col);

    while (queue.isNotEmpty) {
      final (i, j) = queue.removeFirst();

      handler(i, j - 1);
      handler(i - 1, j);
      handler(i, j + 1);
      handler(i + 1, j);
    }

    while (to_paint.isNotEmpty) {
      final (i, j) = to_paint.removeFirst();

      grid[i][j] = color;
    }

    return grid;
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
  // print(
  //   Solution().colorBorder(
  //     [
  //       [1, 1, 1],
  //       [1, 1, 1],
  //       [1, 1, 1],
  //     ],
  //     1,
  //     1,
  //     2,
  //   ),
  // );

  print(
    Solution().colorBorder(
      [
        [1, 2, 1, 2, 1, 2],
        [2, 2, 2, 2, 1, 2],
        [1, 2, 2, 2, 1, 2],
      ],
      1,
      3,
      1,
    ),
    // [
    //   [1, 1, 1, 1, 1, 2],
    //   [1, 2, 1, 1, 1, 2],
    //   [1, 1, 1, 1, 1, 2],
    // ],
    // [
    //   [1, 1, 1, 1, 1, 2],
    //   [1, 2, 1, 1, 1, 2],
    //   [1, 1, 1, 1, 1, 2],
    // ],
  );
}
