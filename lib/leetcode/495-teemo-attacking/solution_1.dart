// 1
// ms
// Beats
// 100.00%

class Solution {
  int findPoisonedDuration(List<int> timeSeries, int duration) {
    if (duration == 0) return 0;

    int count = duration;

    for (var i = 1; i < timeSeries.length; i++) {
      final diff = timeSeries[i] - timeSeries[i - 1];

      // print((diff, duration));

      if (diff >= duration) {
        count += duration;
      } else {
        count += diff;
      }

      // print((timeSeries[i], count));
    }

    return count;
  }
}

void main(List<String> args) {
  print(Solution().findPoisonedDuration([1, 2, 3, 4, 5], 5));
}
