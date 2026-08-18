// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> stableMountains(List<int> height, int threshold) {
    final result = <int>[];

    for (var i = 1; i < height.length; i++) {
      if (height[i - 1] > threshold) {
        result.add(i);
      }
    }

    return result;
  }
}
