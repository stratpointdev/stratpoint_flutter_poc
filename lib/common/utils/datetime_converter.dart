import 'package:intl/intl.dart';

class DateTimeConverter{
  static String convert(String date){

    DateTime dateTime = DateTime.parse(date);
    var formatter = new DateFormat('MMM dd');
    String formatted = formatter.format(dateTime);
    return formatted;

  }
}
