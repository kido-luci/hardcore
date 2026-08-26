import 'dart:typed_data';

// 6
// ms
// Beats
// 100.00%

class MyHashMap {
  MyHashMap() {}

  final _storage = Uint32List(1000001);

  void put(int key, int value) {
    _storage[key] = value + 1;
  }

  int get(int key) {
    return _storage[key] - 1;
  }

  void remove(int key) {
    _storage[key] = 0;
  }
}
