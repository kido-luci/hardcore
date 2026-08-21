// 1
// ms
// Beats
// 100.00%

class Solution {
  List<int> findErrorNums(List<int> nums) {
    final counts = List.filled(nums.length + 1, 0);

    for (final e in nums) {
      counts[e]++;
    }

    // print(counts);

    int? dup;
    int? miss;

    for (var i = 1; i <= nums.length; i++) {
      // print(i);

      switch (counts[i]) {
        case 0:
          miss = i;
          if (dup != null) return [dup, miss];
          break;
        case 2:
          dup = i;
          if (miss != null) return [dup, miss];
          break;
      }
    }

    return [];
  }
}

main() {
  print(Solution().findErrorNums([2, 3, 2])); // 21
  print(Solution().findErrorNums([2, 2])); // 21
  print(Solution().findErrorNums([3, 2, 2])); // 21
  print(Solution().findErrorNums([1, 2, 2, 4])); // 23
  print(Solution().findErrorNums([1, 1])); // 12
  print(Solution().findErrorNums([3, 3, 1])); // 32
  print(Solution().findErrorNums([3, 2, 3, 4, 6, 5])); // 31
  print(Solution().findErrorNums([1, 5, 3, 2, 2, 7, 6, 4, 8, 9])); //2,10
}
