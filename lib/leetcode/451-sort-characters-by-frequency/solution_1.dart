import 'dart:typed_data';

// 25
// ms
// Beats
// 100.00%

class Solution {
  String frequencySort(String s) {
    final count = Uint32List(127);

    for (final e in s.codeUnits) count[e]++;

    final stack = RingStack<(int, int)>(127);

    for (var i = 0; i < 127; i++) {
      final c = count[i];
      if (c > 0) stack.push((c, i));
    }

    final codes = stack.toList()..sort((a, b) => b.$1.compareTo(a.$1));

    final result = IntStack(s.length);

    for (var (count, code) in codes) {
      while (count-- > 0) result.push(code);
    }

    return String.fromCharCodes(result.toList());
  }
}

/// LIFO of any type on a fixed-capacity buffer — the stack counterpart of
/// `RingQueue<T>`.
///
/// Measured about twice as fast as a plain `List<T>` used with `add` and
/// `removeLast` (push-then-pop-all of objects, 30 to 1,000,000 items, buffer
/// reused across rounds): the growable list pays for its length bookkeeping and
/// growth checks on every call, while each read here pays only a cast from `T?`
/// back to `T`. For `int` itself, `IntStack` is still the one to use.
///
/// [capacity] must be at least the greatest number of items alive at one time.
/// Popped slots are not cleared, so a popped object stays reachable until its
/// slot is overwritten — the same trade `RingQueue<T>` makes.
class RingStack<T> {
  final List<T?> _buf;
  int _length = 0;

  RingStack(int capacity) : _buf = List<T?>.filled(capacity, null);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The top of the stack, without removing it.
  T get last => _buf[_length - 1] as T;

  void push(T value) => _buf[_length++] = value;

  T pop() => _buf[--_length] as T;

  /// Drops the top [count] items without reading them — a count off the top,
  /// not `List.removeRange`'s start and end. Unchecked, like [pop].
  void removeRange(int count) => _length -= count;

  /// Drops every item. Keeps the buffer for reuse.
  void clear() => _length = 0;

  /// The items bottom to top, as a new growable list. Changing it does not
  /// change the stack.
  List<T> toList() => List<T>.generate(_length, (i) => _buf[i] as T);

  /// Bottom to top, in the same `[a, b, c]` format as a `List`.
  @override
  String toString() => toList().toString();
}

/// LIFO of ints on a fixed-capacity typed buffer.
///
/// Faster than `List<int>` used as a stack — but not for the reason it looks
/// like. `List<int>` does **not** box: the Dart VM stores any int that fits in
/// 63 bits directly in the slot, with no heap object behind it. (Measurably so.
/// Filling a `List<int>` with values past 2^62, which genuinely do become heap
/// objects, costs more than ten times as much as filling it with small ones.)
///
/// The win is narrower and duller than boxing: 4 bytes a slot instead of 8, so
/// half the memory traffic and twice as much of the stack in cache; no write
/// barrier, because a typed array holds no references for the collector to
/// track; and nothing allocated or copied after the constructor, so `push` and
/// `pop` are one bounds-checked store or load each.
///
/// [capacity] must be at least the greatest number of items alive at one time.
/// For a grid traversal that marks each cell as it is pushed, every cell is
/// pushed at most once, so `rows * cols` is enough.
///
/// For any element type other than `int`, see `RingStack` (`ring_stack.dart`) — and read its
/// note first: the win here is specific to `int`, and it comes from the
/// narrower slots described above, not from preallocation.
///
/// Do not change [_buf] to `List<int>` in order to pick a narrower element type
/// per instance. Three buffer types then reach this code and every access
/// becomes a polymorphic call, which gives back the whole advantage. One
/// concrete type is the point. `Int32List` covers -2^31 .. 2^31 - 1, which is
/// every LeetCode int constraint; 4 bytes a slot is not worth trading for.
class IntStack {
  final Int32List _buf;
  int _length = 0;

  IntStack(int capacity) : _buf = Int32List(capacity);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The top of the stack, without removing it.
  int get last => _buf[_length - 1];

  void push(int value) => _buf[_length++] = value;

  int pop() => _buf[--_length];

  /// Drops the top [count] items without reading them.
  ///
  /// Note this is not `List.removeRange`, which takes a start and an end. Here
  /// there is one argument and it is a count, taken off the top — `pop` for
  /// several items at once. Like [pop], it does not check that there are that
  /// many to drop.
  void removeRange(int count) => _length -= count;

  /// Drops every item. Keeps the buffer, so reusing one stack across many
  /// traversals costs no further allocation.
  void clear() => _length = 0;

  /// The items bottom to top, as a new list — the same order `List<int>` would
  /// hold them in if it had been used as the stack. Changing the returned list
  /// does not change the stack.
  ///
  /// The copy is an `Int32List`: one block copy, far cheaper than building a
  /// `List<int>` item by item, but fixed-length (`add` throws) and truncating
  /// anything stored into it to 32 bits.
  List<int> toList() => _buf.sublist(0, _length);

  List<int> all() => _buf;
}
