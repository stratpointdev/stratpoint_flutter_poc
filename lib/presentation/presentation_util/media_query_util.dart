class MediaQueryUtil {
  static double convertWidth(double screenWidth, double mockUpSize) {
    double mockUpWidth = 320.0; //320 is mock up screen width
    double percentage = mockUpSize / mockUpWidth;
    return screenWidth * percentage;
  }

  static double convertHeight(double screenHeight, double mockUpSize) {
    double mockUpHeight = 684.0; //684.0 is mock up screen height
    double percentage = mockUpSize / mockUpHeight;
    return screenHeight * percentage;
  }
}
