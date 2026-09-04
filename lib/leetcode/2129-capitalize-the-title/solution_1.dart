// 3
// ms
// Beats
// 100.00%

class Solution {
  String capitalizeTitle(String title) {
    final codes = title.codeUnits.toList();

    var start = 0;

    for (var i = 0; i < codes.length; i++) {
      if (codes[i] == 32) {
        if (i - start > 2) {
          codes[start] -= 32;
        }

        start = i + 1;
      } else if (codes[i] < 97) {
        codes[i] += 32;
      }
    }

    if (title.length - start > 2) codes[start] -= 32;

    return String.fromCharCodes(codes);
  }
}

void main(List<String> args) {
  print(Solution().capitalizeTitle(''));
  print(Solution().capitalizeTitle('A'));
  print(Solution().capitalizeTitle('a'));
  print(Solution().capitalizeTitle("ZW Cl pyR uoC"));
}
