import 'package:flutter/material.dart';

class MobileViewPlanDetailsWidget extends StatefulWidget {
  @override
  _MobileViewPlanDetailsWidget createState() => _MobileViewPlanDetailsWidget();
}

class _MobileViewPlanDetailsWidget extends State<MobileViewPlanDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Plan Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff244857),
                    fontFamily: 'FSElliotPro',
                    fontSize: 22,
                    fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding:
                  EdgeInsets.only(top: 24, left: 16, right: 20, bottom: 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your current plan:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'ThePlan 1799',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Cut off date:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 57),
                      Text(
                        '23rd of the month',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Contract Expiry:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 32),
                      Text(
                        'December 12, 2020',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Months remaining:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '8 months(s)',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(
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
                ],
              ),
            ),
          ],
    );
  }
}
