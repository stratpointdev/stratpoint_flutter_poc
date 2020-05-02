import 'package:flutter/material.dart';

class AccountDesktopDashboard extends StatefulWidget {
  const AccountDesktopDashboard({
    this.profile,
    this.mobile,
    this.duoNumber,
    this.profilePicture,
  });

  final String profile;
  final String mobile;
  final String duoNumber;
  final String profilePicture;

  @override
  _AccountDesktopDashboard createState() => _AccountDesktopDashboard();
}

class _AccountDesktopDashboard extends State<AccountDesktopDashboard> {
  static const IconData expand_more =
      IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff037DB4),
      padding: EdgeInsets.only(left: 150, top: 26, bottom: 49),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(widget.profilePicture),
            backgroundColor: Colors.transparent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left : 24.0),
                child: Text(widget.profile,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Container(
                width: 215,
                padding: const EdgeInsets.only(left : 24.0),
                child: Text(widget.mobile,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 8,0,0),
                    child: Text("View other accounts",
                        style:
                            TextStyle(fontSize: 12, color: Color(0x80ffffff)),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Icon(expand_more, color: Color(0x80ffffff)),
                  )
                ],
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 31.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Duo Number",
                    style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
                Text(widget.duoNumber,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left)
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
