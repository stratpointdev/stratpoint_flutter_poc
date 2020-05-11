import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'desktop_view/desktop_view_dashboard.dart';
import 'mobile_view/mobile_view_dashboard.dart';




//this handle whether to render the web desktop view or mobile view dashboard
class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //condition that if the max width of the browser is greater that 1150 then Desktop view will be render.
        //reason why we implement 1150 is because the desktop view UI is responsive down until 1150.
        if (constraints.maxWidth > 1150) {
          return DesktopViewDashboard();
        } else {
          return const MobileDashboard();
        }
      },
    );
  }
}
