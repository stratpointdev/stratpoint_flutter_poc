import 'package:flutter/material.dart';

class AccountMobileDashboard extends StatefulWidget {
  const AccountMobileDashboard({
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
  _AccountMobileDashboard createState() => _AccountMobileDashboard();
}

class _AccountMobileDashboard extends State<AccountMobileDashboard> {
  static const IconData expand_more =
      IconData(0xe5cf, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Color(0xff037DB4),
        height: 120,
        padding: EdgeInsets.only(left: 28, top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 12, 10),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(widget.profilePicture),
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ]),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 15, 4),
                      child: Text(widget.profile,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Text("${widget.mobile} | ${widget.duoNumber}",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.left),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 5),
                            child: Text("View other accounts",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0x80ffffff), fontWeight: FontWeight.w200),
                                textAlign: TextAlign.left)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 2,4),
                          child: Icon(expand_more, color: Color(0x80ffffff)),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
