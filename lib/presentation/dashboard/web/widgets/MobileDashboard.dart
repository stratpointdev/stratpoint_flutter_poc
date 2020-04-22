import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/AccountMobileDashboard.dart';
import 'package:flutter/cupertino.dart';

import 'MobileMenu.dart';

class MobileDashboard extends StatefulWidget {
   const MobileDashboard();

   @override
  _MobileDashboard createState() => _MobileDashboard();
}

class _MobileDashboard extends State<MobileDashboard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("assets/images/mobiletopbanner.png"),
              ),
            ),
          ),

          AccountMobileDashboard(
            profile: "Samantha",
            mobile: "0918 XXXX XXXX",
            duoNumber: "(02) 2920118",
            profilePicture: "https://i.imgur.com/BoN9kdC.png",
          ),

          MobileMenu()
        ],
      ),
    );;
  }
}