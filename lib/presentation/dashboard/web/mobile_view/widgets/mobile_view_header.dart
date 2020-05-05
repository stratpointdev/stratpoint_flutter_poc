import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/r.dart';

class MobileViewHeader extends StatelessWidget {
  const MobileViewHeader();

  static const IconData search = IconData(0xe8b6, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Color(0xff244958), fontSize: 14),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Container(
                    width: 85,
                    height: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(R.assetsImagesGlobelogo),
                      ),
                    ),
                  )),
              Expanded(
                child: Spacer(),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundImage: AssetImage(R.assetsImagesUser),
                    backgroundColor: Colors.transparent,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    search,
                    color: Color(0xff33464D),
                    size: 30,
                  )),
            ],
          ),
        ),
        Container(
          color: Color(0xff93B9C0),
          padding: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              "GLOBEONE",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
