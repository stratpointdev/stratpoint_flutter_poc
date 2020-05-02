import 'package:intl/intl.dart';

class NumberConverter {
  static String pesoCurrency(double number) {
    return NumberFormat.currency(decimalDigits: 2, symbol: '₱').format(number);
  }
}
