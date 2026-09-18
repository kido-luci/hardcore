import 'dart:typed_data';

/// FIFO of ints on a fixed-capacity ring buffer.
///
/// Same structure as `RingQueue`, specialised to `int`. What that buys is not
/// an escape from boxing — the Dart VM already stores small ints inline, and a
/// `List<int>` allocates nothing per element. It buys 4-byte slots instead of
/// 8-byte ones, no write barrier, and no cast on removal. Small as each of
/// those is, together they are why `RingQueue<int>` loses to this class and to
/// `dart:collection`'s `Queue<int>` alike.
///
/// Do not change [_buf] to `List<int>` in order to pick a narrower element type
/// per instance. Three buffer types then reach this code and every access
/// becomes a polymorphic call — measured slower than `Queue<int>`, which is the
/// whole thing this class exists to beat. One concrete type is the point.
/// `Int32List` covers -2^31 .. 2^31 - 1, which is every LeetCode int
/// constraint; 4 bytes a slot is not worth trading for.
class IntQueue {
  final Int32List _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  IntQueue(int capacity)
    : _capacity = capacity,
      _buf = Int32List(capacity);

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
