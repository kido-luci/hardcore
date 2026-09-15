import 'dart:typed_data';

// 35
// ms
// Beats
// 100.00%

class Solution {
  int minReorder(int n, List<List<int>> connections) {
    final visted = List.filled(n, false)..[0] = true;
    final paths = List.generate(n, (_) => <int>[]);
    final revert_path = List.generate(n, (_) => <int>[]);

    for (final e in connections) {
      paths[e[0]].add(e[1]);
      revert_path[e[1]].add(e[0]);
    }

    final queue = IntQueue(n);

    var count = 0;

    void add_2_queue(int node) {
      for (final e in paths[node]) {
        if (visted[e]) continue;

        visted[e] = true;
        queue.add(e);
        count++;
      }

      for (final e in revert_path[node]) {
        if (visted[e]) continue;

        visted[e] = true;
        queue.add(e);
      }
    }

    add_2_queue(0);

    while (queue.isNotEmpty) add_2_queue(queue.removeFirst());

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
