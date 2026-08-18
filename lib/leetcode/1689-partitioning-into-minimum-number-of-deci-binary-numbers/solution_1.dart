// 103
// ms
// Beats
// -%
class Solution {
  int minPartitions(String n) {
    int count = 0;

    while (n != '0') {
      count++;

      final remain = StringBuffer('0');

      bool takeZero = false;

      for (final e in n.codeUnits) {
        final shouldWrite = e - 1;

        if (shouldWrite > 48) {
          takeZero = true;
          remain.writeCharCode(shouldWrite);
        } else if (takeZero) {
          remain.writeCharCode(48);
        }
      }

      n = remain.toString();
    }

    return count;
  }
}
