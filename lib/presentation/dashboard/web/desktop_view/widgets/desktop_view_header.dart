import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/r.dart';

class DesktopViewHeader extends StatelessWidget {
  const DesktopViewHeader();

  static const IconData search = IconData(0xe8b6, fontFamily: 'MaterialIcons');
  static const IconData userIcon =
      IconData(0xe939, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 40,right: 40 , bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 29, right: 23),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide( //                    <--- top side
                        color: Color(0xff009CDF),
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.only(top: 16.5),
                    child: Text(
                      'Personal',
                      style: TextStyle(
                          color: const Color(0xff009CDF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 23 , top: 19),
                child: Text(
                  'Business',
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24 , top: 19),
                child: Text(
                  'Shop',
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only( top: 19),
                child: Text(
                  'G Community',
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 29 , top: 19),
                child: Text(
                  'Help & Support',
                  style: TextStyle(
                      color: const Color(0xff33464D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 42 , top: 19),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      color: const Color(0xff33464D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 14 , top: 19),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundImage: AssetImage(R.assetsImagesUser),
                    backgroundColor: Colors.transparent,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 8 , top: 19),
                child: Text(
                  'Logged In',
                  style: TextStyle(
                      color: const Color(0xff33464D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(right: 30 , top: 19),
                  child: Icon(search, color: Color(0xff33464D))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 12, top: 16),
                  child: Container(
                    width: 173,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.assetsImagesGlobelogo),
                      ),
                    ),
                  )),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 18, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide( //                    <--- top side
                          color: Color(0xff979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Text(
                        'STAY SAFE AT HOME',
                        style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                      ),
                    ),
                  )),

              Padding(
                  padding: const EdgeInsets.only(right: 18, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide( //                    <--- top side
                          color: Color(0xff979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Text(
                        'MOBILE',
                        style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 18, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide( //                    <--- top side
                          color: Color(0xff979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Text(
                        'GLOBE AT HOME',
                        style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                      ),
                    ),
                  )),

              Padding(
                  padding: const EdgeInsets.only(right: 18, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide( //                    <--- top side
                          color: Color(0xff979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Text(
                        'INTERNATIONAL',
                        style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 19, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide( //                    <--- top side
                          color: Color(0xff979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(right: 9.0),
                      child: Text(
                        'GLOBE LIFE',
                        style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                      ),
                    ),
                  )),


              const Padding(
                  padding: EdgeInsets.only(right: 30, top: 20),
                  child: Text(
                    'REWARDS',
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  ))
            ],
          ),

        ],
      ),
    );
  }
}
