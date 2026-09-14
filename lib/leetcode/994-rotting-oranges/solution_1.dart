import 'dart:math';

// 3
// ms
// Beats
// 88.89%

class Solution {
  int orangesRotting(List<List<int>> grid) {
    final r = grid.length;
    final c = grid.first.length;
    final len = r * c;

    var times = 3;

    final q_rotten = RingQueue<(int, int, int)>(len);

    final q_fresh = RingQueue<(int, int)>(len);

    void add_2_q(int i, int j, int k) {
      grid[i][j] = k;
      q_rotten.add((i, j, k));

      times = max(times, k);
    }

    void check(int i, int j, int k) {
      if (i < 0 || i == r || j < 0 || j == c) return;
      if (grid[i][j] != 1) return;

      add_2_q(i, j, k);
    }

    void ff(int i, int j) => add_2_q(i, j, 3);

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        switch (grid[i][j]) {
          case 1:
            q_fresh.add((i, j));
            break;
          case 2:
            ff(i, j);
            break;
          default:
        }
      }
    }

    while (q_rotten.isNotEmpty) {
      var (i_1, j_1, k_1) = q_rotten.remove();

      k_1++;

      check(i_1 - 1, j_1, k_1);
      check(i_1, j_1 - 1, k_1);
      check(i_1 + 1, j_1, k_1);
      check(i_1, j_1 + 1, k_1);
    }

    while (q_fresh.isNotEmpty) {
      final (i, j) = q_fresh.remove();
      if (grid[i][j] == 1) return -1;
    }

    return times - 3;
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
}

// // 3
// // ms
// // Beats
// // 88.89%

// class Solution {
//   int orangesRotting(List<List<int>> grid) {
//     // for (final e in grid) print(e);

//     final r = grid.length;
//     final c = grid.first.length;
//     final len = r * c;

//     var times = 3;

//     final stack_i = IntQueue(len);
//     final stack_j = IntQueue(len);
//     final stack_k = IntQueue(len);

//     final to_check_i = IntQueue(len);
//     final to_check_j = IntQueue(len);

//     void add_2_q(int i, int j, int k) {
//       grid[i][j] = k;
//       stack_i.add(i);
//       stack_j.add(j);
//       stack_k.add(k);

//       times = max(times, k);
//     }

//     void check(int i, int j, int k) {
//       if (i < 0 || i == r || j < 0 || j == c) return;
//       if (grid[i][j] != 1) return;

//       add_2_q(i, j, k);
//     }

//     void ff(int i, int j) => add_2_q(i, j, 3);

//     for (var i = 0; i < r; i++) {
//       for (var j = 0; j < c; j++) {
//         switch (grid[i][j]) {
//           case 1:
//             to_check_i.add(i);
//             to_check_j.add(j);
//             break;
//           case 2:
//             ff(i, j);
//             break;
//           default:
//         }
//       }
//     }

//     while (stack_j.isNotEmpty) {
//       final i_1 = stack_i.remove();
//       final j_1 = stack_j.remove();
//       final k_1 = stack_k.remove() + 1;

//       check(i_1 - 1, j_1, k_1);
//       check(i_1, j_1 - 1, k_1);
//       check(i_1 + 1, j_1, k_1);
//       check(i_1, j_1 + 1, k_1);
//     }

//     while (to_check_j.isNotEmpty) {
//       if (grid[to_check_i.remove()][to_check_j.remove()] == 1) return -1;
//     }

//     // print('-----');

//     // for (final e in grid) print(e);

//     return times - 3;
//   }
// }

// class IntQueue {
//   final Uint8List _buf;
//   final int _capacity;
//   int _head = 0;
//   int _length = 0;

//   IntQueue(int capacity) : _capacity = capacity, _buf = Uint8List(capacity);

//   bool get isEmpty => _length == 0;

//   bool get isNotEmpty => _length != 0;

//   int get length => _length;

//   /// The front of the queue, without removing it.
//   int get first => _buf[_head];

//   void add(int value) {
//     var tail = _head + _length;
//     if (tail >= _capacity) tail -= _capacity;

//     _buf[tail] = value;
//     _length++;
//   }

//   int remove() {
//     final value = _buf[_head];

//     _head++;
//     if (_head == _capacity) _head = 0;

//     _length--;

//     return value;
//   }

//   void clear() {
//     _head = 0;
//     _length = 0;
//   }
// }

void main(List<String> args) {
  print(
    Solution().orangesRotting([
      [2, 1, 1],
      [1, 1, 1],
      [0, 1, 2],
    ]),
  );
}
