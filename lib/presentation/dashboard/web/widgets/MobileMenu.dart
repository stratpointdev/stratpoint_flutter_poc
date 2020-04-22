import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu();

  @override
  _MobileMenu createState() => _MobileMenu();
}

class _MobileMenu extends State<MobileMenu> {

  static const IconData expand_more = IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(60, 10, 60, 5),
      color: Color(0xff1587B7),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              "Dashboard",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.left
          ),

          Icon(
            expand_more,
            color: Color(0x80ffffff)
          )
        ]
      )
    );
  }
}