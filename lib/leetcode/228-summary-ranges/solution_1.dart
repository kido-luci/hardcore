// 1
// ms
// Beats
// 100.00%

class Solution {
  List<String> summaryRanges(List<int> nums) {
    final result = <String>[];
    int? start, current;

    void take() {
      if (start == null) return;
      if (start == current) {
        result.add(start.toString());
      } else {
        result.add('$start->$current');
      }
    }

    for (final e in nums) {
      if (start == null) {
        start = e;
        current = e;
      } else {
        if (e - current! == 1) {
          current = e;
        } else {
          take();

          start = e;
          current = e;
        }
      }
    }

    take();

    return result;
  }
}
