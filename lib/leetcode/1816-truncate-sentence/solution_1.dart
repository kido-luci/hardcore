// 2
// ms
// Beats
// 83.33%

class Solution {
  String truncateSentence(String s, int k) {
    int countSpace = 0;
    final buffer = StringBuffer();

    for (var i = 0; i < s.length; i++) {
      if (s[i] == ' ') {
        countSpace++;
        if (countSpace == k) {
          break;
        }
      }

      buffer.write(s[i]);
    }

    return buffer.toString();
  }
}
