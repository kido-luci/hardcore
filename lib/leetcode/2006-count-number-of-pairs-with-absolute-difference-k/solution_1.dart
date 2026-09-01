class Solution {
  int countKDifference(List<int> nums, int k) {
    final c = List.filled(101, 0);

    for (final e in nums) c[e]++;

    var match = 0;

    for (var i = 1; i <= 100; i++) {
      final cup = i + k;
      if (cup > 100) break;

      match += c[i] * c[cup];
      c[i] = 0;
    }

    return match;
  }
}
