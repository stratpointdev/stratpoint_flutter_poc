import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'desktop_view/desktop_dashboard.dart';
import 'mobile_view/mobile_dashboard.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenTypeLayout(
          desktop: DesktopDashboard(),
          tablet: DesktopDashboard(),
          mobile: MobileDashboard()),
    );
  }
}
