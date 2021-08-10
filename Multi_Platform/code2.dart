extension Sorting on List<int> {
  List<int> sortAsc() {
    var list = this;
    var length = this.length;

    for (int i = 0; i < length - 1; i++) {
      int min = i;

      for (int j = i; j < length; j++) {
        if (list[j] < list[min]) {
          min = j;
        }
      }

      int temp = list[min];
      list[min] = list[i];
      list[i] = temp;
    }

    return list;
  }
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}
