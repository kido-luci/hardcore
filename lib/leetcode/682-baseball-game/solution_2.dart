// 1
// ms
// Beats
// 100.00%

class Solution {
  int calPoints(List<String> operations) {
    final records = <int>[];
    var sum = 0, newVal = 0;

    for (final e in operations) {
      switch (e) {
        case '+':
          newVal = records.last + records[records.length - 2];
          records.add(newVal);
          sum += newVal;
          break;
        case 'D':
          newVal = records.last * 2;
          records.add(newVal);
          sum += newVal;
          break;
        case 'C':
          sum -= records.removeLast();
          break;
        default:
          newVal = int.parse(e);
          records.add(newVal);
          sum += newVal;
      }
    }

    return sum;
  }
}
