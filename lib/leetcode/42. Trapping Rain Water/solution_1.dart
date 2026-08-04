// The rule is that each water container will overflow at the shorter side
// So use two pointer is best solution
// the left is 0, and the right the end of list trap
// on the loop we choose check from left side or right side
// depend on which side is shorter
// and check until the current container break
// - it mean the other is longer than the current side
// the area of trapping rain water = shorter side - each child height
//
// 0ms - On
class Solution {
  int trap(List<int> height) {
    int rain = 0;

    var left = 0, right = height.length - 1;

    while (left < right) {
      // if the left side is equal or shorter than the right side
      if (height[left] <= height[right]) {
        // start from next of left
        var i = left + 1;

        while (i < right && height[i] <= height[left]) {
          // if the height is inside the container
          // cal the rain can be trap
          rain += height[left] - height[i];
          i++;
        }

        // update the left index by the longer side
        left = i;
      }
      // if the right side is shorter than the left side
      else {
        var j = right - 1;

        while (j > left && height[j] <= height[right]) {
          rain += height[right] - height[j];
          j--;
        }

        right = j;
      }
    }

    return rain;
  }
}
