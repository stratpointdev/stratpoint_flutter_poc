import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/AccountDesktopDashboard.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/DesktopMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopDashboard extends StatefulWidget {

  const DesktopDashboard();

  @override
  _DesktopDashboard createState() => _DesktopDashboard();
}

class _DesktopDashboard extends State<DesktopDashboard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("assets/images/topbanner.png"),
              ),
            ),
          ),

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