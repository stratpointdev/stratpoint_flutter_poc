import 'package:intl/intl.dart';

class DateTimeConverter {
  //Method used to get the current date
  static String getDateWithYearNow() {
    final DateTime dateTime = DateTime.now();
    //Format used for formal 3 Letter Month Shorthand date  4 shorthand year (e.g May. 05 2020)
    final DateFormat formatter = DateFormat('MMM. dd yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  //Method used to convert date string into 3 Letter Month and 2 shorthand date (e.g May. 05)
  static String convertToDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM dd');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  //Method used to convert date the Over Due Date into the correct Due Date
  static String convertOverDueDateToDueDate(String date) {
    final DateTime dateTime = DateTime.parse(date.split('T')[0]);
    final DateTime newDateTime =  dateTime.subtract(const Duration(days: 1));
    //Format used for formal 3 Letter Month Shorthand date (e.g May. 05)
    final DateFormat formatter = DateFormat('MMM dd');
    final String formatted = formatter.format(newDateTime);
    return formatted;
  }

  //Method used covert date string into 3 Letter Month , 2 shorthand data and 4 shorthand year (e.g May 05 2020)
  static String convertToDateWithYear(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM. dd yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
  //Method used covert datetime string
  static String convertToDateTime(String date) {
    final DateTime dateTime = DateTime.parse(date);
    // Format 3 Letter Month , 2 shorthand data and 4 shorthand year (e.g May 05 2020)
    final DateFormat dateFormatter = DateFormat('MMM. dd yyyy,');
    // format for time 2 shorthand for hour : 2 shorthand for minute 2short abbreviation for before midday. and after midday(e.g 11:00 am)
    final DateFormat timeFormatter = DateFormat(' hh:mm aa');
    final String formatted = dateFormatter.format(dateTime) +
        timeFormatter.format(dateTime).replaceFirst('0', '');
    return formatted;
  }

  //method to get the current time
  static String getTimeNow() {
    final DateTime dateTime = DateTime.now();
    // format for time 2 shorthand for hour : 2 shorthand for minute 2short abbreviation for before midday. and after midday(e.g 11:00 am)
    final DateFormat formatter = DateFormat('hh:mm aa');
    final String formatted = formatter.format(dateTime).replaceFirst('0', '');
    return formatted;
  }

//Method to get difference of String date and DateTime.now in seconds
  static int getSecsDiff(String date) {
    final DateTime lastAPICallDate = convertToComparable(date);
    return DateTime.now().difference(lastAPICallDate).inSeconds;
  }


//Convert date into comparable data
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
