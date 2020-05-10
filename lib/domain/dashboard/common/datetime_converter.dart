import 'package:intl/intl.dart';

class DateTimeConverter {
  static String getDateWithYearNow() {
    final DateTime dateTime = DateTime.now();
    final DateFormat formatter = DateFormat('MMM. dd yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static String convertToDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM dd');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
  static String convertOverDueDateToDueDate(String date) {
    final DateTime dateTime = DateTime.parse(date.split('T')[0]);
    final DateTime newDateTime =  dateTime.subtract(const Duration(days: 1));
    final DateFormat formatter = DateFormat('MMM dd');
    final String formatted = formatter.format(newDateTime);
    return formatted;
  }

  static String convertToDateWithYear(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM. dd yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static String convertToDateTime(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat dateFormatter = DateFormat('MMM. dd yyyy,');
    final DateFormat timeFormatter = DateFormat(' hh:mm aa');
    final String formatted = dateFormatter.format(dateTime) +
        timeFormatter.format(dateTime).replaceFirst('0', '');
    return formatted;
  }

  static String getTimeNow() {
    final DateTime dateTime = DateTime.now();
    final DateFormat formatter = DateFormat('hh:mm aa');
    final String formatted = formatter.format(dateTime).replaceFirst('0', '');
    return formatted;
  }

  static int getSecsDiff(String date) {
    final DateTime lastAPICallDate = convertToComparable(date);
    return DateTime.now().difference(lastAPICallDate).inSeconds;
  }

  static DateTime convertToComparable(String date) {
    if (date != null) {
      final List<String> list = date.split(RegExp(r'[- :.]'));
      return DateTime(
          int.parse(list[0]),
          int.parse(list[1]),
          int.parse(list[2]),
          int.parse(list[3]),
          int.parse(list[4]),
          int.parse(list[5]));
    } else {
      return DateTime(1980, 10, 10);
    }
  }
}
