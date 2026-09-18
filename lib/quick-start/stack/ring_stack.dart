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

  /// The backing buffer itself — no copy — at the capacity given to the
  /// constructor, not at [length]. Slots from [length] on hold whatever was
  /// last there. Meant for the end of a solve, once nothing will push or pop
  /// again: writing to it writes to the stack.
  List<T?> get all => _buf;

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
