// 36
// ms
// Beats
// 100.00%

class Solution {
  int countSubIslands(List<List<int>> grid1, List<List<int>> grid2) {
    final r = grid2.length, c = grid2.first.length;
    final area = r * c;

    int count = 0;

    bool is_child = true;

    final queue = RingQueue<(int, int)>(area);

    void add_2_q(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (grid2[i][j] != 1) return;
      if (grid1[i][j] == 0) is_child = false;

      grid2[i][j] = 0;
      queue.add((i, j));
    }

    void handler(int i, int j) {
      is_child = true;

      add_2_q(i, j);

      while (queue.isNotEmpty) {
        final (i, j) = queue.removeFirst();

        add_2_q(i, j - 1);
        add_2_q(i - 1, j);
        add_2_q(i, j + 1);
        add_2_q(i + 1, j);
      }

      if (is_child) count++;
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (grid2[i][j] == 1) handler(i, j);
      }
    }

    return count;
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
