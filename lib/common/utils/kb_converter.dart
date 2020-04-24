class KBConverter{
  static String convert(double num ){

      var marker = 1000;
      var gigaBytes = marker *marker;

      return(num / gigaBytes).toStringAsFixed(3) + " GB";

  }

}