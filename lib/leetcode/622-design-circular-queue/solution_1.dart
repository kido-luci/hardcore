import 'dart:typed_data';

// 3
// ms
// Beats
// 100.00%

class MyCircularQueue {
  late final Uint16List queue;
  late int len;
  int buffer = 0;
  int end = -1;
  int start = 0;
  late int end_val;
  int? start_val;

  MyCircularQueue(int k) {
    queue = Uint16List(k);
    len = k;
  }

  bool enQueue(int value) {
    if (isFull()) return false;

    buffer++;
    end = end < len - 1 ? end + 1 : 0;
    queue[end] = end_val = value;
    return true;
  }

  bool deQueue() {
    if (isEmpty()) return false;
    buffer--;
    start = start < len - 1 ? start + 1 : 0;
    start_val = null;

    return true;
  }

  int Front() {
    return isEmpty() ? -1 : (start_val ??= queue[start]);
  }

  int Rear() {
    return isEmpty() ? -1 : end_val;
  }

  bool isEmpty() {
    return buffer == 0;
  }

  bool isFull() {
    return buffer == len;
  }
}

void main(List<String> args) {
  final m = MyCircularQueue(3);
  print(m.enQueue(1));
  print(m.enQueue(2));
  print(m.enQueue(3));
  print(m.Front());
  print(m.Rear());
  print(m.deQueue());
  print(m.Front());
  print(m.Rear());
  print(m.enQueue(1));
  print(m.Front());
  // print(m.Rear());
}
