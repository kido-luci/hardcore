import 'dart:typed_data';

// 1907
// ms
// Beats
// 100.00%

class Solution {
  List<int> longestSpecialPath(List<List<int>> edges, List<int> nums) {
    final n = nums.length;

    final nodes = List.generate(n + 1, (_) => <(int, int)>[]);
    for (final e in edges) {
      nodes[e[0]].add((e[1], e[2]));
      nodes[e[1]].add((e[0], e[2]));
    }

    int r_weight = 0, r_nodes = 1;

    final visited = Uint32List(n);
    final counts = Uint32List(5 * 10000 + 1);

    final sum_win = <(int, int)>[];
    int i = 0;
    int sum = 0;

    final stack = <(int, int)>[(0, 0)];
    // visited[0] = 1;

    // final cal = List<(int, int)?>.filled(n, null);

    while (stack.isNotEmpty) {
      final (node, weight) = stack.last;
      final digit = nums[node];
      final pre_i = visited[node] - 1;

      if (pre_i == -1) {
        counts[digit]++;
        visited[node] = i + 1;
        while (counts[digit] > 1) counts[sum_win[i++].$1]--;
        sum_win.add((digit, sum += weight));
        final c_node = sum_win.length - i;
        final c_weight = sum - sum_win[i].$2;
        if (c_weight > r_weight || (c_weight == r_weight && c_node < r_nodes))
          (r_weight, r_nodes) = (c_weight, c_node);

        for (final (child_node, child_weight) in nodes[node]) {
          if (visited[child_node] > 0) continue;

          stack.add((child_node, child_weight));
          // dfs(child_node, child_weight, node);
        }
      } else {
        while (i > pre_i) counts[sum_win[--i].$1]++;
        sum_win.removeLast();
        sum -= weight;
        counts[digit]--;
        stack.removeLast();
      }
    }

    return [r_weight, r_nodes];
  }
}

// Runtime Error
// 671 / 675 testcases passed
// import 'dart:typed_data';

// class Solution {
//   List<int> longestSpecialPath(List<List<int>> edges, List<int> nums) {
//     final n = nums.length;

//     final nodes = List.generate(n + 1, (_) => <(int, int)>[]);
//     for (final e in edges) {
//       nodes[e[0]].add((e[1], e[2]));
//       nodes[e[1]].add((e[0], e[2]));
//     }

//     int r_weight = 0, r_nodes = 1;

//     final visited = Uint8List(n);
//     final counts = Uint32List(5 * 10000 + 1);

//     final sum_win = <(int, int)>[];
//     int i = 0;
//     int sum = 0;

//     void dfs(int node, int weight) {
//       // void dfs(int node, int weight, int from) {
//       final digit = nums[node];
//       counts[digit]++;

//       final pre_i = i;

//       while (counts[digit] > 1) counts[sum_win[i++].$1]--;

//       sum_win.add((digit, sum += weight));

//       final c_node = sum_win.length - i;
//       final c_weight = sum - sum_win[i].$2;
//       if (c_weight > r_weight || (c_weight == r_weight && c_node < r_nodes))
//         (r_weight, r_nodes) = (c_weight, c_node);

//       // print('$from->$node:  c_weight:$c_weight / c_node:$c_node');

//       for (final (child_node, child_weight) in nodes[node]) {
//         if (visited[child_node] == 1) continue;
//         visited[child_node] = 1;

//         dfs(child_node, child_weight);
//         // dfs(child_node, child_weight, node);
//       }

//       while (i > pre_i) counts[sum_win[--i].$1]++;
//       sum_win.removeLast();
//       sum -= weight;
//       counts[digit]--;
//     }

//     visited[0] = 1;
//     dfs(0, 0);
//     // dfs(0, 0, -1);

//     return [r_weight, r_nodes];
//   }
// }

void main(List<String> args) {
  print(
    Solution().longestSpecialPath(
      [
        [0, 1, 2],
        [1, 2, 3],
        [1, 3, 5],
        [1, 4, 4],
        [2, 5, 6],
      ],
      [2, 1, 2, 1, 3, 1],
    ),
  );
}
