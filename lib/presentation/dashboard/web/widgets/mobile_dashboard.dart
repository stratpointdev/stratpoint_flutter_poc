import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/account_mobile_dashboard.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/mobile_header.dart';
import 'package:flutter/material.dart';
import 'mobile_menu.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard();

  @override
  _MobileDashboard createState() => _MobileDashboard();
}

class _MobileDashboard extends State<MobileDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MobileHeader(),
          AccountMobileDashboard(
            profile: "Samantha",
            mobile: "0918 XXXX XXXX",
            duoNumber: "(02) 2920118",
            profilePicture: "https://i.imgur.com/BoN9kdC.png",
          ),
          MobileMenu()
        ],
      ),
    );
  }
}
