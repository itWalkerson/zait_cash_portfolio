extension BoolExtensions on bool {
  double toDouble() {
    if (this) {
      return 1;
    } else {
      return 0;
    }
  }

  int toInt() {
    if (this) {
      return 1;
    } else {
      return 0;
    }
  }
}
