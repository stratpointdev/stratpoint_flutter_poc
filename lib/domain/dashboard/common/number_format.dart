import 'package:intl/intl.dart';

class NumberConverter {

  //method to convert number into peso with 2 decimal places
  static String pesoCurrency(double number) {
    return NumberFormat.currency(decimalDigits: 2, symbol: '₱').format(number);
  }
}
