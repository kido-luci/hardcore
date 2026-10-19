// 15
// ms
// Beats
// 100.00%

import 'package:hardcore/model/linked_list.dart';

class Solution {
  List<List<int>> spiralMatrix(int m, int n, ListNode? head) {
    final result = List.generate(m, (_) => List.filled(n, -1));
    final len = m * n;

    // 0: l -> r
    // 1: t -> b
    // 2: r -> l
    // 3: b -> t
    int direct = 0;

    bool valid(int i, int j) {
      if (i == -1 || i == m || j == -1 || j == n) return false;
      return result[i][j] == -1;
    }

    int i = 0;
    int j = 0;
    int count = 0;
    while (count < len && head != null) {
      count++;
      result[i][j] = head.val;
      head = head.next;

      switch (direct) {
        case 0:
          if (valid(i, j + 1)) {
            j++;
          } else {
            i++;
            direct = 1;
          }
        case 1:
          if (valid(i + 1, j)) {
            i++;
          } else {
            j--;
            direct = 2;
          }
        case 2:
          if (valid(i, j - 1)) {
            j--;
          } else {
            i--;
            direct = 3;
          }
        default:
          if (valid(i - 1, j)) {
            i--;
          } else {
            j++;
            direct = 0;
          }
      }
    }

    return result;
  }
}
