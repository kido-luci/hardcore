// 11
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> allPathsSourceTarget(List<List<int>> graph) {
    List<List<int>> dfs(List<int> nodes) {
      final result = <List<int>>[];

      for (final node in nodes) {
        if (node == graph.length - 1) {
          result.add([node]);
          continue;
        }

        for (final path in dfs(graph[node])) {
          result.add([node, ...path]);
        }
      }

      return result;
    }

    return dfs(graph[0]).map((e) => [0, ...e]).toList();
  }
}
