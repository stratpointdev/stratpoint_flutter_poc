
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/menu_item.dart';



class DesktopMenu extends StatelessWidget {
  const DesktopMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(280, 5, 60, 5),
      color: Color(0xff1587B7),
      height: 30,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              MenuItem(
                  item: "Dashboard",
                  textStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: MenuItem(
                    item: "My Plan & Usage",
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)
                ),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: MenuItem(
                    item: "Bills & Payment",
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)
                ),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: MenuItem(
                    item: "Account Details & Request",
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)
                ),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: MenuItem(
                    item: "Inbox",
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)
                ),
              )
            ],
          ),

          Spacer()
        ],
      ),
    );
  }

}