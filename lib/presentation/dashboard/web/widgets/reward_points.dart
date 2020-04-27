import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../r.dart';

class RewardPoints extends StatelessWidget {

  const RewardPoints();

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
                "Reward Points",
                style: TextStyle(fontSize: 22, color: Color(0xff244857)),
                textAlign: TextAlign.left
            ),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 24, bottom: 24, left: 20, right: 20),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                          "You Have:",
                          style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                          "197 Points",
                          style: TextStyle(fontSize: 36, color: Color(0xff244857)),
                          textAlign: TextAlign.left
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                      "As our customer, you’re in for a surprise every day! from your favorite mobile promos to treats, there’s a world of wonderful rewards that awaits you!",
                      style: TextStyle(fontSize: 14, color: Color(0xff244857)),
                      textAlign: TextAlign.left
                  ),
                ),

                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Container(
                            width: 123,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(R.image1),
                              ),
                            ),
                          )
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Container(
                            width: 123,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(R.image2),
                              ),
                            ),
                          )
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Container(
                            width: 123,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(R.image3),
                              ),
                            ),
                          )
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Container(
                            width: 123,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(R.image4),
                              ),
                            ),
                          )
                      ),

                    ],
                  )
                ),

                Container(
                  child: Row(
                    children: <Widget>[
                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                            "Go to Globe Rewards",
                            style: TextStyle(fontSize: 14, color: Color(0xff244857), decoration: TextDecoration.underline),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ],
                  ),
                )



              ],
            ),
          )


        ]
      )
    );
  }
}