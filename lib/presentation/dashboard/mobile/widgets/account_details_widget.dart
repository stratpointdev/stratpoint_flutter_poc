import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/presentation_util/media_query_util.dart';

class AccountDetailsWidget extends StatefulWidget {
  @override
  _AccountDetailsWidgetState createState() => _AccountDetailsWidgetState();

  final String userName;
  final String userMobileNumber;
  final String userDuoNumber;

  const AccountDetailsWidget(
      {this.userName, this.userMobileNumber, this.userDuoNumber});
}

class _AccountDetailsWidgetState extends State<AccountDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: MediaQueryUtil.convertHeight(screenHeight, 53),
      child: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(.8),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQueryUtil.convertWidth(screenWidth, 32),
              height: MediaQueryUtil.convertHeight(screenHeight, 32),
              decoration: const BoxDecoration(
                color: Color(0xffF8D31C),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.userName,
                    key: const Key('userNameWidget'),
                    style: TextStyle(
                        fontFamily: 'FSElliotPro',
                        fontSize:
                            MediaQueryUtil.convertHeight(screenHeight, 15),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.userMobileNumber + widget.userDuoNumber,
                    style: TextStyle(
                      fontFamily: 'FSElliotPro',
                      fontSize: MediaQueryUtil.convertHeight(screenHeight, 11),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          VerticalDivider(
            color: Theme.of(context).accentColor,
            indent: MediaQueryUtil.convertHeight(screenHeight, 13),
            endIndent: MediaQueryUtil.convertHeight(screenHeight, 13),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
