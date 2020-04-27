import 'package:intl/intl.dart';

class DateTimeConverter{

  static String getDateWithYearNow(){

    DateTime dateTime = DateTime.now();
    var formatter = new DateFormat('MMM. dd yyyy');
    String formatted = formatter.format(dateTime);
    return formatted;
  }
  static String convertToDate(String date){

    DateTime dateTime = DateTime.parse(date);
    var formatter = new DateFormat('MMM dd');
    String formatted = formatter.format(dateTime);
    return formatted;

  }

  static String convertToDateWithYear(String date){

    DateTime dateTime = DateTime.parse(date);
    var formatter = new DateFormat('MMM. dd yyyy');
    String formatted = formatter.format(dateTime);
    return formatted;

  }
  static String convertToDateTime(String date){

    DateTime dateTime = DateTime.parse(date);
    var formatter = new DateFormat('MMM. dd yyyy, hh:mm aa');

    String formatted = formatter.format(dateTime);
    return formatted;

  }



}
