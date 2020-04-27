
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/r.dart';

class DesktopHeader extends StatelessWidget {

  const DesktopHeader();

  static const IconData search = IconData(0xe8b6, fontFamily: 'MaterialIcons');
  static const IconData userIcon = IconData(0xe939, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text("Personal",
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text("Business",
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text("Shop",
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text("G Community",
                  style: TextStyle(color: Color(0xff009CDF), fontSize: 14),
                ),
              ),

              Expanded(
                child: Spacer(),
              ),

              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text("Help & Support",
                  style: TextStyle(color: Color(0xff33464D), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text("Contact Us",
                  style: TextStyle(color: Color(0xff33464D), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundImage:
                    NetworkImage(R.assetsImagesUser),
                    backgroundColor: Colors.transparent,
                  )
              ),

              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("Logged In",
                  style: TextStyle(color: Color(0xff33464D), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),


              Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Icon(search, color: Color(0xff33464D))
              ),


            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Container(
                    width: 173,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(R.assetsImagesGlobelogo),
                      ),
                    ),
                  )
              ),

              Expanded(
                  child: Spacer()
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("STAY SAFE AT HOME",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("MOBILE",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("MOBILE",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("GLOBE AT HOME",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("INTERNATIONAL",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("GLOBE LOFE",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: Text("|",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(right: 30, top: 20),
                  child: Text("REWARDS",
                    style: TextStyle(color: Color(0xff33464D), fontSize: 14),
                  )
              )
            ],
          )
        ],
      ),
    );
  }

}