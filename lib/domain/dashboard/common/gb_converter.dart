class GBConverter {

// method used to convert kilobytes(num) into gigabytes
  static String convert(int num) {
    //marker represent the size for megabyte
    const int marker = 1024;
    const int gigaBytes = marker * marker;
   //formula to convert kilobytes into gigabytes and added 1 fix decimal place.
    return (num / gigaBytes).toStringAsFixed(1) + ' GB';
  }
}
