// 0
// ms
// Beats
// 100.00%

class Solution {
  int findClosest(int x, int y, int z) {
    final dis_x = (x - z).abs();
    final dis_y = (y - z).abs();

    if (dis_x == dis_y) {
      return 0;
    }

    if (dis_x < dis_y) {
      return 1;
    }

    return 2;
  }
}
