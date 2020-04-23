import 'package:flutter/cupertino.dart';
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

  static const IconData expand_more = IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xff037DB4),
      height: 165,
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                    NetworkImage(widget.profilePicture),
                    backgroundColor: Colors.transparent,
                  ),
                )
              ],
            ),
          ),


          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Text(
                      widget.profile,
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Text(
                      widget.mobile,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.left
                  ),
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 5, 10),
                      child: Text(
                          "View other accounts",
                          style: TextStyle(fontSize: 12, color: Color(0x80ffffff)),
                          textAlign: TextAlign.left
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 5, 10),
                      child: Icon(
                          expand_more,
                          color: Color(0x80ffffff)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Text(
                      "Duo Number",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.left
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Text(
                      widget.duoNumber,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.left
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}