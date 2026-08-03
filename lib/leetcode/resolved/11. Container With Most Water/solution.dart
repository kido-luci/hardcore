import 'dart:math';

/*
Hi, I’m Luci

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49

the max area of water (blue section) the container can contain is 49.

area = w x h = (j - i) * min(ni, nj)


Notice that you may not slant the container. : ))

—-

[1,8,6,2,5,4,8,3,7]
use two pointer i at 0; j at n-1

loop until the list empty

the question is that we should move i or j

on each move pointer the width is decrease by one

w = j - i
j-- = i++

we just care on the height; so keep the higher one to ensure

w * h ~< w - 1 * new height
*/

class Solution {
  int maxArea(List<int> height) {
    var i = 0, j = height.length - 1;
    var maxArea = 0;

    while (j > i) {
      maxArea = max(maxArea, (j - i) * min(height[i], height[j]));

      if (height[i] < height[j]) {
        i++;
      } else {
        j--;
      }
    }

    return maxArea;
  }
}
