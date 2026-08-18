// 6
// ms
// Beats
// 100%
class Solution {
  int numberOfEmployeesWhoMetTarget(List<int> hours, int target) {
    int sum = 0;

    for (final e in hours) {
      if (e >= target) {
        sum++;
      }
    }

    return sum;
  }
}
