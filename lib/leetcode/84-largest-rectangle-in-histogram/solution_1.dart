import 'dart:math';

// 25
// ms
// Beats
// 57.14%

class Solution {
  int largestRectangleArea(List<int> heights) {
    // print(heights);
    int area = 0;

    final stack = <(int, int)>[];

    void clear() {
      int width = 0;

      while (stack.isNotEmpty) {
        final (height, last_width) = stack.removeLast();
        width += last_width;
        area = max(area, height * width);
      }
    }

    for (final height in heights) {
      if (height == 0) {
        clear();
        continue;
      }

      int new_width = 0;

      while (stack.isNotEmpty && stack.last.$1 >= height) {
        final (last_heigh, last_width) = stack.removeLast();
        new_width += last_width;

        area = max(area, last_heigh * new_width);
      }

      stack.add((height, new_width + 1));

      // print('height: $height, area: ${height * new_width}, $stack');
    }

    clear();

    return area;
  }
}

void main(List<String> args) {
  print('====');
  print(Solution().largestRectangleArea([2, 1, 5, 6, 2, 3]));
}
