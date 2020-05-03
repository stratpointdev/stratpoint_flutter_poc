
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/menu_item.dart';



class DesktopMenu extends StatelessWidget {
  const DesktopMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(242, 12, 0, 13),
      color: Color(0xff1587B7),
      child: Row(
        children: <Widget>[
          MenuItem(
              item: "Dashboard",
              textStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)
          ),

          Padding(
            padding: EdgeInsets.only(left: 23, right: 22),
            child: MenuItem(
                item: "My Plan & Usage",
                textStyle: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w300)
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 23),
            child: MenuItem(
                item: "Bills & Payment",
                textStyle: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w300)
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 22),
            child: MenuItem(
                item: "Account Details and Requests",
                textStyle: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w300)
            ),
          ),

          MenuItem(
              item: "Inbox",
              textStyle: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w300)
          ),

          Spacer()
        ],
      ),
    );
  }

}