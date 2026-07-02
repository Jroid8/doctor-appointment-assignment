String formatNumber(int value) {
  List<int> result = List<int>.empty(growable: true);
  int i = 0;
  while (value > 0) {
    if (i > 0 && i % 3 == 0) result.add(0x2c);
    result.add(0x30 + value % 10);
    value ~/= 10;
    i++;
  }
  return String.fromCharCodes(result.reversed);
}
