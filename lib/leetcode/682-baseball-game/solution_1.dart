// 3
// ms
// Beats
// 42.86%
class Solution {
  int calPoints(List<String> operations) {
    final records = <int>[];
    var sum = 0;

    for (final e in operations) {
      switch (e) {
        case '+':
          records.add(records.last + records[records.length - 2]);
          sum += records.last;
          break;
        case 'D':
          records.add(records.last * 2);
          sum += records.last;
          break;
        case 'C':
          sum -= records.removeLast();
          break;
        default:
          records.add(int.parse(e));
          sum += records.last;
      }
    }

    return sum;
  }
}
