import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../r.dart';

class RewardPointsWidget extends StatelessWidget {
  final int points;
  final bool hasTitlePadding;

  const RewardPointsWidget({this.points: 197, this.hasTitlePadding: false});

  @override
  Widget build(BuildContext context) {
    const double leftPadding = 24;
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              left: hasTitlePadding ? leftPadding : 0,
            ),
            child: Text(
              'Reward Points',
              style: TextStyle(fontSize: 22, color: Color(0xff244857)),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(leftPadding),
            height: 382,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'You Have:',
                      style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                    Spacer(),
                    Text(
                      '$points ' + (points == 1 ? 'point' : 'points'),
                      style: TextStyle(fontSize: 36, color: Color(0xff244857),fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'As our customer, you’re in for a surprise every day! from your favorite mobile promos to treats, there’s a world of wonderful rewards that awaits you!',
                  style: TextStyle(fontSize: 14, color: Color(0xff244857)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [R.assetsImagesImage1, R.assetsImagesImage2, R.assetsImagesImage3, R.assetsImagesImage4]
                        .map(
                          (image) => Container(
                            padding: EdgeInsets.only(top: 16),
                            width: 143,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(image),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Go to Globe Rewards",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff244857),
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
