import 'package:flutter/material.dart';

class DesktopHeaderMenu extends StatelessWidget {
  const DesktopHeaderMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff244A59),
        padding: EdgeInsets.only(top: 7, bottom: 7, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 29),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "About Us",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24),
              child:FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "Governance",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "Investor",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 28),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "News",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 27),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "Sustainability",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Text(
                  "Careers",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ));
  }
}
