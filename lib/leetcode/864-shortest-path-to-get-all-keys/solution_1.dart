import 'dart:typed_data';

// 197
// ms
// Beats
// 100.00%

class Solution {
  int shortestPathAllKeys(List<String> grid) {
    final r = grid.length;
    final c = grid.first.length;
    final area = r * c;
    final start_char = '@'.codeUnits[0];
    final block_char = '#'.codeUnits[0];
    final empty_char = '.'.codeUnits[0];

    (int, int)? start;
    int total_key = 0;

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        final val = grid[i][j].codeUnits[0];

        if (val == start_char) {
          start = (i, j);
        } else {
          if (val >= 65 && val <= 90) total_key++;
        }
      }
    }

    // for (final e in grid) {
    //   print(e);
    // }

    // print('total_key: $total_key');

    if (start == null) return -1;

    final queue = RingQueue<(int, int, int, int, Uint8List, List<Uint8List>)>(
      area * total_key * total_key,
    );

    final visited_by_set = <String, List<Uint8List>>{}; // khai báo cạnh key_set

    bool add_2_q(int i, int j, int moved, int taked, Uint8List keys, List<Uint8List> visited) {
      if (i < 0 || i == r || j < 0 || j == c) return false;
      if (visited[i][j] == 1) return false;

      visited[i][j] = 1;

      final val = grid[i][j].codeUnits[0];

      if (val == block_char) return false;

      if (val == empty_char || val == start_char) {
        queue.add((i, j, moved, taked, keys, visited));
        return false;
      }

      if (val < 97) {
        if (keys[val - 65] > 0) {
          // print('open: $val');

          queue.add((i, j, moved, taked, keys, visited));
        }

        return false;
      }

      if (keys[val - 97] == 0) {
        taked++;

        if (taked == total_key) {
          // print('last get: $val');
          // for (var i = 0; i < 6; i++) {
          //   if (keys[i] == 1) print('last key: ${String.fromCharCode(i + 97)}');
          // }

          // for (final e in visited) {
          //   print(e);
          // }

          return true;
        }

        final new_keys = Uint8List.fromList(keys)..[val - 97] = 1;
        final v = visited_by_set.putIfAbsent(
          new_keys.join(),
          () => List.generate(r, (_) => Uint8List(c)),
        );

        if (v[i][j] == 1) return false;
        v[i][j] = 1;

        queue.add((i, j, moved, taked, new_keys, visited_by_set[new_keys.join()]!));
      } else {
        queue.add((i, j, moved, taked, keys, visited));
      }

      return false;
    }

    add_2_q(start.$1, start.$2, 0, 0, Uint8List(total_key), List.generate(r, (_) => Uint8List(c)));

    while (queue.isNotEmpty) {
      var (i, j, moved, taked, keys, visited) = queue.removeFirst();
      moved++;

      if (add_2_q(i, j - 1, moved, taked, keys, visited) ||
          add_2_q(i - 1, j, moved, taked, keys, visited) ||
          add_2_q(i, j + 1, moved, taked, keys, visited) ||
          add_2_q(i + 1, j, moved, taked, keys, visited))
        return moved;
    }

    return -1;
  }
}

class RingQueue<T> {
  final List<T?> _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  RingQueue(int capacity) : _capacity = capacity, _buf = List<T?>.filled(capacity, null);

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
  print(Solution().shortestPathAllKeys(["@...a", ".###A", "b.BCc"]));
  print(Solution().shortestPathAllKeys(["@abcdeABCDEFf"]));
}
