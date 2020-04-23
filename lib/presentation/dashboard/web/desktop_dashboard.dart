import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/account_desktop_dashboard.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/desktop_header_menu.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/desktop_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/desktop_header.dart';

class DashBoardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[

          DesktopHeaderMenu(),

          DesktopHeader(),

          AccountDesktopDashboard(
            profile: "Samantha",
            mobile: "0918 XXXX XXXX",
            duoNumber: "(02) 2920118",
            profilePicture: "https://i.imgur.com/BoN9kdC.png",
          ),

          DesktopMenu()
        ],
      ),
    );
  }
}