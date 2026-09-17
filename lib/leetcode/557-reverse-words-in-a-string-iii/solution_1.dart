// 14
// ms
// Beats
// 100.00%

class Solution {
  String reverseWords(String s) {
    int start = 0;

    final codes = s.codeUnits.toList();

    final len = s.length;

    for (var i = 1; i <= len; i++) {
      if (i != len && s[i] != ' ') continue;

      // print(String.fromCharCodes(codes.sublist(start, i)));

      final mid = ((i - 1) - start) ~/ 2;

      for (var j = 0; j <= mid; j++) {
        final tmp = codes[start + j];
        codes[start + j] = codes[i - 1 - j];
        codes[i - 1 - j] = tmp;
      }

      // print(String.fromCharCodes(codes.sublist(start, i)));

      start = i + 1;
    }

    return String.fromCharCodes(codes);
  }
}

void main(List<String> args) {
  print(Solution().reverseWords("Let's take LeetCode contest"));
}
