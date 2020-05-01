import 'package:flutter/material.dart';

class SpendingLimitWidget extends StatefulWidget {
  @override
  _SpendingLimitWidget createState() => _SpendingLimitWidget();
}

class _SpendingLimitWidget extends State<SpendingLimitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 720,
      height: 440,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Spending Limit',
            style: TextStyle(
              color: Color(0xff244857),
              fontFamily: 'FSElliotPro',
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'From Mar. 24 up to present',
                style: TextStyle(
                  color: Color(0xff244857),
                  fontFamily: 'FSElliotPro',
                  fontSize: 12,
                ),
              ),
              Text(
                'Reset on Apr. 24',
                style: TextStyle(
                  color: Color(0xff244857),
                  fontFamily: 'FSElliotPro',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Excess usage',
            style: TextStyle(
              color: Color(0xff244857),
              fontFamily: 'FSElliotPro',
              fontSize: 12,
            ),
          ),
          SizedBox(height: 12),
          Image.asset("assets/images/webspeedlimit.png"),
          SizedBox(height: 12),
          Text(
            'REMEMBER: Reaching your speed limit due to excess usage charge may cause temporary disconnect of line',
            style: TextStyle(
              color: Color(0xff244857),
              fontFamily: 'FSElliotPro',
              fontSize: 12,
            ),
          ),
          Text(
            'Learn more',
            style: TextStyle(
              color: Color(0xff244857),
              fontFamily: 'FSElliotPro',
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
            color: Color(0xff7F959D),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Excess Usage',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FSElliotPro',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\u20B1 0.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FSElliotPro',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    BulletWidget(),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'There are charges that used your Spending Limit and may consist of call, text, and mobile data that are not part of your plan.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FSElliotPro',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    BulletWidget(),
                    SizedBox(width: 10),
                    Text(
                      'Roaming and Shar-A-Load charges may not be displayed here.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FSElliotPro',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'View excess Usage Breakdown',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'FSElliotPro',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BulletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
