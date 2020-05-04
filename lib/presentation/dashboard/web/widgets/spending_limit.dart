import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/r.dart';

class SpendingLimitWidget extends StatefulWidget {

  final  bool isMobileView;
  const SpendingLimitWidget({this.isMobileView = false});

  @override
  _SpendingLimitWidget createState() => _SpendingLimitWidget();
}

class _SpendingLimitWidget extends State<SpendingLimitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 689,
      height: 500,
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
              fontSize: 20,
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
                  fontSize: 14,
                ),
              ),
              Text(
                'Reset on Apr. 24',
                style: TextStyle(
                  color: Color(0xff244857),
                  fontFamily: 'FSElliotPro',
                  fontSize: 14,
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
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Image.asset(widget.isMobileView ?  R.assetsImagesMobilespeedlimit : R.assetsImagesWebspeedlimit,),
          SizedBox(height: 30),
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
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 29),
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
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\u20B1 0.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FSElliotPro',
                        fontSize: 18,
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
                          fontSize: 14,
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
                        fontSize: 14,
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
                      fontSize: 14,
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
