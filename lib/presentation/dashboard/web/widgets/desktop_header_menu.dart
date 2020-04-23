import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopHeaderMenu extends StatelessWidget {

  const DesktopHeaderMenu();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Color(0xff244A59),
        height: 30,
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Spacer(),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("About Us",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("Governance",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("Investor",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("News",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("Sustainability",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text("Careers",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )

          ],
        )
    );
  }
}
