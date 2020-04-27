import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadBalance extends StatefulWidget {

  const LoadBalance();

  @override
  _LoadBalance createState() => _LoadBalance();

}

class _LoadBalance extends State<LoadBalance> {

  static const IconData refresh = IconData(0xe5d5, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Load Balance",
              style: TextStyle(fontSize: 22, color: Color(0xff244857)),
              textAlign: TextAlign.left
            ),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "As of Apr. 22, 2020",
                        style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                        textAlign: TextAlign.left
                      ),
                    ),

                    Spacer(),

                    //add refresh icon here
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(
                          refresh,
                          color: Color(0xff244857)
                      ),
                    )
                    //end of refresh icon here
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Expires on Apr. 22, 2021, 10:25 AM",
                    style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                    textAlign: TextAlign.left,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                      "P13.50",
                      style: TextStyle(fontSize: 36, color: Color(0xff244857)),
                      textAlign: TextAlign.left
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                      "View Loading History",
                      style: TextStyle(fontSize: 14, color: Color(0xff244857), decoration: TextDecoration.underline),
                      textAlign: TextAlign.left
                  ),
                ),

                Padding(
                  padding:EdgeInsets.symmetric(horizontal:10.0),
                  child:Container(
                    height:1.0,
                    width:130.0,
                    color:Color(0xff979797))
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                          "Last Load Amount",
                          style: TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "P50.00",
                          style: TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "Last Load Date",
                          style: TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "Apr. 22, 2020",
                          style: TextStyle(fontSize: 16, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}