// 0
// ms
// Beats
// 100.00%

class Solution {
  int titleToNumber(String columnTitle) {
    int count = 0;
    int pow = 1;

    for (var j = columnTitle.length - 1; j >= 0; j--) {
      count += pow * (columnTitle.codeUnitAt(j) - 64);
      pow *= 26;
    }

    return count;
  }
}
