// 21ms
class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final result = <String, List<String>>{};

    for (final e in strs) {
      final keys = List.filled(26, 0);

      for (final char in e.codeUnits) {
        keys[char - 97]++;
      }

      (result[String.fromCharCodes(keys)] ??= []).add(e);
    }

    return result.values.toList();
  }
}
