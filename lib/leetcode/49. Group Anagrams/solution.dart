//27ms
class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final result = <String, List<String>>{};

    for (final e in strs) {
      final key = (e.split('')..sort()).join();

      (result[key] ??= []).add(e);
    }

    return result.values.toList();
  }
}
