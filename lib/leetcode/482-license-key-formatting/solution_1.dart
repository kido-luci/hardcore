import 'dart:typed_data';

// 2
// ms
// Beats
// 100.00%

class Solution {
  String licenseKeyFormatting(String s, int k) {
    final codes = Uint8List(s.length + (s.length ~/ k) + 1);

    int window = 0;
    int start = codes.length;

    final space = '-'.codeUnitAt(0);

    for (var j = s.length - 1; j >= 0; j--) {
      final c = s.codeUnitAt(j);

      if (c == space) continue;

      if (++window > k) {
        codes[--start] = space;
        window = 1;
      }

      codes[--start] = c > 90 ? c - 32 : c;
    }

    return String.fromCharCodes(codes, start);
  }
}

void main(List<String> args) {
  print(Solution().licenseKeyFormatting('aa', 1));
}
