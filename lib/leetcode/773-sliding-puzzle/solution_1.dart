import 'dart:collection';
import 'dart:typed_data';

// 37
// ms
// Beats
// 100.00%

class Solution {
  int slidingPuzzle(List<List<int>> board) {
    const win = '123450';

    final mem = <String>{};

    final r = 2;
    final c = 3;

    final queue = ListQueue<(int, int, int, List<Uint8List>)>();
    int? add_2_queue(int i, int j, int next_i, int next_j, int moved, List<Uint8List> board) {
      if (next_i == -1 || next_i == r || next_j == -1 || next_j == c) return null;
      final new_board = List.generate(2, (i) => Uint8List.fromList(board[i]));
      new_board[i][j] = board[next_i][next_j];
      new_board[next_i][next_j] = 0;
      final key = new_board[0].join() + new_board[1].join();
      if (!mem.add(key)) return null;
      if (key == win) return moved;
      queue.add((next_i, next_j, moved, new_board));
      return null;
    }

    int handler() {
      while (queue.isNotEmpty) {
        var (i, j, moved, board) = queue.removeFirst();
        moved++;
        var try_move =
            add_2_queue(i, j, i, j - 1, moved, board) ??
            add_2_queue(i, j, i - 1, j, moved, board) ??
            add_2_queue(i, j, i, j + 1, moved, board) ??
            add_2_queue(i, j, i + 1, j, moved, board);

        if (try_move != null) return try_move;
      }

      return -1;
    }

    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (board[i][j] == 0) {
          final first = add_2_queue(
            i,
            j,
            i,
            j,
            0,
            List.generate(2, (i) => Uint8List.fromList(board[i])),
          );

          if (first != null) return first;
          return handler();
        }
      }
    }

    return -1;
  }
}

void main(List<String> args) {
  print(
    Solution().slidingPuzzle([
      [1, 2, 3],
      [4, 0, 5],
    ]),
  );

  print(
    Solution().slidingPuzzle([
      [1, 2, 3],
      [5, 4, 0],
    ]),
  );

  print(
    Solution().slidingPuzzle([
      [4, 1, 2],
      [5, 0, 3],
    ]),
  );
}
