import 'dart:typed_data';

// 9
// ms
// Beats
// 100.00%

class Solution {
  List<int> rearrangeArray(List<int> nums) {
    final len = nums.length;
    final half = len ~/ 2;
    final pos = IntQueue(half);
    final nev = IntQueue(half);

    for (final e in nums) (e > 0 ? pos : nev).add(e);

    final result = Int32List(len);

    for (var i = 0; i < len; i += 2) {
      result[i] = pos.removeFirst();
      result[i + 1] = nev.removeFirst();
    }

    return result;
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

  /// The backing buffer itself — no copy — at the capacity given to the
  /// constructor, not at [length], in buffer order rather than queue order
  /// (the front sits at the current head, and a wrapped queue is split across
  /// the end). Meant for the end of a solve, once nothing will add or remove
  /// again: writing to it writes to the queue.
  Int32List get all => _buf;

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
