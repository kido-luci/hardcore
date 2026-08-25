import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int captureForts(List<int> forts) {
    int emptyIndex = -1;
    int armyIndex = -1;
    int count = 0;

    int best = 0;

    for (var i = 0; i < forts.length; i++) {
      switch (forts[i]) {
        case 0:
          if (emptyIndex != -1 || armyIndex != -1) {
            count++;
          }
          break;
        case 1:
          if (emptyIndex != -1) {
            best = max(best, count);
            count = 0;
            emptyIndex = -1;
          }

          if (armyIndex != -1) {
            count = 0;
          }

          armyIndex = i;

          break;
        default:
          if (armyIndex != -1) {
            best = max(best, count);
            count = 0;
            armyIndex = -1;
          }

          if (emptyIndex != -1) {
            count = 0;
          }

          emptyIndex = i;
      }

      // print((forts[i], emptyIndex, armyIndex, count));
    }

    return best;
  }
}

void main() {
  print(Solution().captureForts([1, 0, 0, -1, 0, 0, -1, 0, 0, 1]));
}
