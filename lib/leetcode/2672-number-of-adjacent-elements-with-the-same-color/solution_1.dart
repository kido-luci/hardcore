// 18
// ms
// Beats
// 100.00%

class Solution {
  List<int> colorTheArray(int n, List<List<int>> queries) {
    final result = <int>[];
    final colors = List.filled(n, 0);
    int total_pair = 0;

    for (final e in queries) {
      final index = e[0];
      final new_color = e[1];
      final current_color = colors[index];

      if (current_color == new_color) {
        result.add(total_pair);
        // print(colors);
        continue;
      }

      if (index > 0) {
        final pre = colors[index - 1];
        if (pre != 0) {
          if (pre == current_color) total_pair--;
          if (pre == new_color) total_pair++;
        }
      }

      if (index < n - 1) {
        final next = colors[index + 1];
        if (next != 0) {
          if (next == current_color) total_pair--;
          if (next == new_color) total_pair++;
        }
      }

      colors[index] = new_color;

      result.add(total_pair);
    }

    return result;
  }
}

// // Time Limit Exceeded
// // 173 / 183 testcases passed
// class Solution {
//   List<int> colorTheArray(int n, List<List<int>> queries) {
//     final result = <int>[];
//     final colors = List.filled(n, 0);
//     int total_pair = 0;

//     for (final e in queries) {
//       final index = e[0];
//       final new_color = e[1];
//       final current_color = colors[index];

//       if (current_color == new_color) {
//         result.add(total_pair);
//         // print(colors);
//         continue;
//       }

//       total_pair = 0;

//       colors[index] = new_color;

//       var i = 0;
//       // print('-------');
//       // print(colors);

//       while (i < n - 1) {
//         // print(i);
//         final c = colors[i];

//         if (c != 0 && ((i < n - 1 && c == colors[i + 1]))) {
//           total_pair++;
//         }

//         i++;
//       }

//       result.add(total_pair);
//     }

//     return result;
//   }
// }
