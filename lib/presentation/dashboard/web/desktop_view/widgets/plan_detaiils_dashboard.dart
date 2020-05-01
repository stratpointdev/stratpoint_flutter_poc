import 'package:flutter/material.dart';

class PlanDetailsWidget extends StatefulWidget {
  @override
  _PlanDetailsWidget createState() => _PlanDetailsWidget();
}

class _PlanDetailsWidget extends State<PlanDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Plan Details',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xff244857),
                fontFamily: 'FSElliotPro',
                fontSize: 22,
              ),
            ),
            SizedBox(height: 14),
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Your current plan:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'ThePlan 1799',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Cut off date:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '23rd of the month',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Contract Expiry:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'December 12, 2020',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Months remaining:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '8 months(s)',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontFamily: 'FSElliotPro',
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 70,
          bottom: 30,
          right: 30,
          child: SizedBox(
            width: 210,
            height: 40,
            child: RawMaterialButton(
              onPressed: () => {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              fillColor: Color(0xff009CDF),
              child: Center(
                child: Text(
                  'View  Details',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
