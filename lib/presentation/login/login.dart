import 'package:globe_one_poc_project/common/brewery.dart';
import 'package:globe_one_poc_project/common/utils/hex_to_int_converter.dart';
import 'package:globe_one_poc_project/common/utils/string_cons.dart';
import 'package:flutter/material.dart';
import 'mobile/login_validation.dart'
    if (dart.library.js) 'web/login_validation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(HexToIntConverter.convert("#0042C4")),
            Theme.of(context).primaryColor
          ],
          tileMode: TileMode.repeated,
        )),
        child: ListView(
          children: <Widget>[
            BreweryTextTitle(
              text: StringCons.signInTitle,
              textColor: Theme.of(context).accentColor,
            ),
            LoginValidationPage(),
          ],
        ),
      ),
    );
  }
}
