// 105
// ms
// Beats
// 50.00%
//
// class MyHashSet {
//   MyHashSet() {}

//   final set = <int>[];

//   void add(int key) {
//     if (!set.contains(key)) {
//       set.add(key);
//     }
//   }

//   void remove(int key) {
//     set.remove(key);
//   }

//   bool contains(int key) {
//     return set.contains(key);
//   }
// }
//
import 'dart:typed_data';

// 5
// ms
// Beats
// 100.00%

class MyHashSet {
  MyHashSet() {}

  final seen = Uint8List(1000001);

  void add(int key) {
    seen[key] = 1;
  }

  void remove(int key) {
    seen[key] = 0;
  }

  bool contains(int key) {
    return seen[key] == 1;
  }
}
