// 14
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    final groups = <int, List<List<int>>>{};

    for (var i = 0; i < groupSizes.length; i++) {
      final lastGroup = (groups[groupSizes[i]] ??= [<int>[]]).last;

      if (lastGroup.length < groupSizes[i]) {
        lastGroup.add(i);
      } else {
        groups[groupSizes[i]]!.add([i]);
      }
    }

    final keys = groups.keys.toList()..sort();

    final result = <List<int>>[];

    for (final key in keys) {
      result.addAll(groups[key]!);
    }

    return result;
  }
}
