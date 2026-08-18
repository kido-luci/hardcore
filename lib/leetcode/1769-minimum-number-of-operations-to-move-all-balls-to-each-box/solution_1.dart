// 34
// ms
// Beats
// 100.00%

class Solution {
  List<int> minOperations(String boxes) {
    final openrations = List.filled(boxes.length, 0);

    for (var i = 0; i <= boxes.length - 1; i++) {
      if (boxes.codeUnitAt(i) == 48) continue;

      for (var j = 0; j <= boxes.length - 1; j++) {
        if (j == i) continue;

        openrations[j] += (j - i).abs();
      }
    }

    return openrations;
  }
}
