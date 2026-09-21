// 263
// ms
// Beats
// 7.14%
class Solution {
  int evalRPN(List<String> tokens) {
    final len = tokens.length;

    final stack = RingStack<(int?, int?)>(len);

    for (var j = len - 1; j >= 0; j--) {
      // print('-----');
      // print(stack);

      // print(tokens[j]);

      final chars = tokens[j];
      if (chars.length == 1) {
        final first = chars.codeUnits[0];

        if (first < 48) {
          stack.push((null, first));
          continue;
        }
      }

      int digit = int.parse(chars);

      while (stack.isNotEmpty && stack.last.$1 != null) {
        final (digit2, _) = stack.pop();
        final (_, operator) = stack.pop();

        // print('$digit ${String.fromCharCode(operator!)}  $digit2');

        switch (operator) {
          case 43:
            digit += digit2!;
          case 45:
            digit -= digit2!;
          case 42:
            digit *= digit2!;
          default:
            digit ~/= digit2!;
        }
      }

      stack.push((digit, null));
    }

    return stack.last.$1!;
  }
}

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

void main(List<String> args) {
  // print(Solution().evalRPN(["2", "1", "+", "3", "*"]));
  // print(Solution().evalRPN(["4", "13", "5", "/", "+"]));
  print(Solution().evalRPN(["-1", "1", "*", "-1", "+"]));
}
