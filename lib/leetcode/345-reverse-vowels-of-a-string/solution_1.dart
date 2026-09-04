// 12
// ms
// Beats
// 72.41%

class Solution {
  String reverseVowels(String s) {
    final vowels = 'aeiou'.codeUnits.toSet();
    final to_r = <int>[];
    for (var i = 0; i < s.length; i++) {
      var c = s.codeUnitAt(i);
      if (c < 97) c += 32;
      if (vowels.contains(c)) to_r.add(i);
    }

    final r = s.codeUnits.toList();

    for (var i = 0; i < to_r.length ~/ 2; i++) {
      final tmp = r[to_r[i]];
      r[to_r[i]] = r[to_r[to_r.length - 1 - i]];
      r[to_r[to_r.length - 1 - i]] = tmp;
    }

    return String.fromCharCodes(r);
  }
}

void main(List<String> args) {
  print(Solution().reverseVowels('IceCreAm'));
}
