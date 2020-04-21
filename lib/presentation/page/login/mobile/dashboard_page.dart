import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/common/utils/media_query_util.dart';
import 'package:globe_one_poc_project/presentation/page/login/mobile/account_details_widget.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Container(
            width: MediaQueryUtil.convertWidth(screenWidth, 59),
            height: MediaQueryUtil.convertHeight(screenHeight, 22),
            child: Image.asset("assets/ic_globe_banner.png"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[AccountDetailsWidget()],
      ),
    );
  }
}
