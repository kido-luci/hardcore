// 115
// ms
// Beats
// 100.00%

class Solution {
  bool validPath(int n, List<List<int>> edges, int source, int destination) {
    if (source == destination) return true;

    final paths = List.generate(n, (_) => <int>[]);
    final queue = RingQueue<int>(n);
    final moved = List.filled(n, false);
    moved[source] = true;

    bool add_2_queue(int node) {
      if (node == destination) return true;

      queue.add(node);
      moved[node] = true;

      return false;
    }

    for (final e in edges) {
      paths[e[0]].add(e[1]);
      paths[e[1]].add(e[0]);

      if (e[0] == source) {
        if (add_2_queue(e[1])) return true;
      }

      if (e[1] == source) {
        if (add_2_queue(e[0])) return true;
      }
    }

    while (queue.isNotEmpty) {
      for (final e in paths[queue.removeFirst()]) {
        if (!moved[e] && add_2_queue(e)) return true;
      }
    }

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

void main(List<String> args) {
  print(
    Solution().validPath(
      3,
      [
        [0, 1],
        [1, 2],
        [2, 0],
      ],
      0,
      2,
    ),
  );

  print(
    Solution().validPath(
      6,
      [
        [0, 1],
        [0, 2],
        [3, 5],
        [5, 4],
        [4, 3],
      ],
      0,
      5,
    ),
  );

  print(
    Solution().validPath(
      10,
      [
        [4, 3],
        [1, 4],
        [4, 8],
        [1, 7],
        [6, 4],
        [4, 2],
        [7, 4],
        [4, 0],
        [0, 9],
        [5, 4],
      ],
      5,
      9,
    ),
  );

  print(
    Solution().validPath(
      10,
      [
        [0, 7],
        [0, 8],
        [6, 1],
        [2, 0],
        [0, 4],
        [5, 8],
        [4, 7],
        [1, 3],
        [3, 5],
        [6, 5],
      ],
      7,
      5,
    ),
  );
}
