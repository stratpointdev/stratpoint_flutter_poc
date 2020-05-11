import 'package:flutter/material.dart';

//widget placeholder for view menu(Dashboard, May Plan & Usage, etc)
class MobileViewMenu extends StatelessWidget {
  const MobileViewMenu();

  static const IconData expand_more =
      IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        color: const Color(0xff1587B7),
        height: 46,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text('Dashboard',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
              textAlign: TextAlign.left),
          const Expanded(
            child: Spacer(),
          ),
          const Icon(expand_more, color: Color(0x80ffffff))
        ]));
  }
}
