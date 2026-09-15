import 'dart:typed_data';

// 2
// ms
// Beats
// 50.00%
//
class Solution {
  bool canVisitAllRooms(List<List<int>> rooms) {
    final room_count = rooms.length;

    final visited = List.filled(room_count, false)..[0] = true;
    var vistit_count = 1;

    final queue = IntQueue(room_count);

    void add_2_q(List<int> keys) {
      for (final key in keys) {
        if (!visited[key]) {
          visited[key] = true;
          vistit_count++;
          queue.add(key);
        }
      }
    }

    add_2_q(rooms[0]);

    while (queue.isNotEmpty) add_2_q(rooms[queue.removeFirst()]);

    return vistit_count == room_count;
  }
}

class IntQueue {
  final Uint16List _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  IntQueue(int capacity) : _capacity = capacity, _buf = Uint16List(capacity);

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
