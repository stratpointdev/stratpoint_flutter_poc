class GBConverter {
  static String convert(int num) {
    const int marker = 1000;
    const int gigaBytes = marker * marker;

    return (num / gigaBytes).toStringAsFixed(1) + ' GB';
  }
}
