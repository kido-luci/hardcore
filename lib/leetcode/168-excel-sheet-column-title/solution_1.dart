// 2
// ms
// Beats
// -%
class Solution {
  String convertToTitle(int columnNumber) {
    // print('==========');
    // print(columnNumber);

    final result = <int>[];

    while (columnNumber > 0) {
      result.add(((--columnNumber) % 26) + 65);
      columnNumber ~/= 26;
    }

    return String.fromCharCodes(result.reversed);
  }
}

void main(List<String> args) {
  print(Solution().convertToTitle(1));
  print(Solution().convertToTitle(2));
  print(Solution().convertToTitle(26));
  print(Solution().convertToTitle(27));
  print(Solution().convertToTitle(28));
  print(Solution().convertToTitle(710));
  print(Solution().convertToTitle(701));
}
