import 'package:intl/intl.dart';


class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy';
  static const TIME_FORMAT = 'hh:mm';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(TIME_FORMAT).format(dateTime);
  }

  DateTime formattedTime(String datetime){
   return DateFormat(TIME_FORMAT).parse(datetime);
  }

}