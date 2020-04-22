import 'package:globe_one_poc_project/common/utils/string_cons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/utils/date_util.dart';

setRememberMe(bool value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(StringCons.signInRememberMe, value);
}

Future<bool> isRemember() async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(StringCons.signInRememberMe) == null) {
    return false;
  }
  return prefs.getBool(StringCons.signInRememberMe);
}

setSessionDate(DateTime value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(
      StringCons.sessionDate, DateUtil().formattedDate(value));
}

Future<DateTime> getSessionDate() async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.getString(StringCons.sessionDate) == null) {
    return null;
  }

  return DateUtil().formattedTime(prefs.getString(StringCons.sessionDate));
}

setSessionToken(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(StringCons.sessionToken, value);
}

Future<String> getSessionToken() async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.getString(StringCons.sessionToken) == null) {
    return "";
  }
  return prefs.getString(StringCons.sessionToken);
}

setPwd(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(StringCons.oldPassword, value);
}

Future<String> getPwd() async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.getString(StringCons.oldPassword) == null) {
    return "";
  }
  return prefs.getString(StringCons.oldPassword);
}
