// 118
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    final r = isWater.length;
    final c = isWater.first.length;
    final len = r * c;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        switch (isWater[i][j]) {
          case 1:
            isWater[i][j] = 0;
            break;
          default:
            isWater[i][j] = -1;
        }
      }
    }

    final queue = RingQueue<(int, int, int)>(len);

    bool is_nearby_water(int i, int j) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      if (isWater[i][j] != 0) return false;

      return true;
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (isWater[i][j] == -1 &&
            (is_nearby_water(i - 1, j) ||
                is_nearby_water(i, j - 1) ||
                is_nearby_water(i + 1, j) ||
                is_nearby_water(i, j + 1))) {
          isWater[i][j] = 1;
          queue.add((i, j, 1));
        }
      }
    }

    void handler(int i, int j, int level) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (isWater[i][j] != -1) return;

      isWater[i][j] = level;
      queue.add((i, j, level));
    }

    while (queue.isNotEmpty) {
      var (i, j, level) = queue.remove();
      level++;

      handler(i - 1, j, level);
      handler(i, j - 1, level);
      handler(i + 1, j, level);
      handler(i, j + 1, level);
    }

    return isWater;
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

  T remove() {
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
