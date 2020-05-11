import 'package:flutter/material.dart';


// widget placeholder for header menu (About Us, Governance, etc)
class DesktopViewHeaderMenu extends StatelessWidget {
  const DesktopViewHeaderMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff244A59),
        padding: const EdgeInsets.only(top: 7, bottom: 7, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 29),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Governance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Inv`estor',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 27),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Sustainability',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Careers',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ],
        ));
  }
}
