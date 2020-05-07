import 'package:flutter/material.dart';

class DesktopViewPlanDetails extends StatefulWidget {
  @override
  _DesktopViewPlanDetails createState() => _DesktopViewPlanDetails();
}

class _DesktopViewPlanDetails extends State<DesktopViewPlanDetails> {
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
                  color: const Color(0xff244857),
                  fontFamily: 'FSElliotPro',
                  fontSize: 22,
                  fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 12),
            Container(
              padding:
                  const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children:const <Widget>[
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
                          color:  Color(0xff244857),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Text(
                        'Cut off date:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '23rd of the month',
                        style: TextStyle(
                          color: const Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 36),
                      const Text(
                        'Contract Expiry:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'December 12, 2020',
                        style: TextStyle(
                          color: const Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 56),
                      const Text(
                        'Months remaining:',
                        style: TextStyle(
                          color: Color(0xff244857),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '8 months(s)',
                        style: TextStyle(
                          color: const Color(0xff244857),
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 276),
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
          right: 23,
          child: SizedBox(
            width: 210,
            height: 40,
            child: RawMaterialButton(
              onPressed: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              fillColor: const Color(0xff009CDF),
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
