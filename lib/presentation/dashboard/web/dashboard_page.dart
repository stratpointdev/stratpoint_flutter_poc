import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'desktop_view/desktop_view_dashboard.dart';
import 'mobile_view/mobile_view_dashboard.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth > 1150) {
            return DesktopViewDashboard();
          }else {
            return MobileDashboard();
          }
      },
    );
  }
}
