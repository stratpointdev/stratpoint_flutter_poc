import 'package:flutter/material.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu();

  static const IconData expand_more =
      IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        color: Color(0xff1587B7),
        height: 40,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text("Dashboard",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.left),
          Expanded(
            child: Spacer(),
          ),
          Icon(expand_more, color: Color(0x80ffffff))
        ]));
  }
}
