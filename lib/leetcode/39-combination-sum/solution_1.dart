// 2
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    final result = <List<int>>[];
    final cur = <int>[];

    var sum = 0;

    void dfs(int start) {
      if (sum == target) {
        result.add(cur.toList());
        return;
      }

      for (var i = start; i < candidates.length; i++) {
        final e = candidates[i];
        if (e + sum > target) continue;
        sum += e;
        cur.add(e);
        dfs(i);
        cur.removeLast();
        sum -= e;
      }
    }

    dfs(0);

    return result;
  }
}

void main(List<String> args) {
  print(Solution().combinationSum([2, 3, 6, 7], 7));
}
