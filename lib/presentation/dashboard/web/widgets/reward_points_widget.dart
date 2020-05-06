import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../r.dart';

class RewardPointsWidget extends StatelessWidget {
  const RewardPointsWidget({this.points = 197, this.hasTitlePadding = false});
  final int points;
  final bool hasTitlePadding;

  @override
  Widget build(BuildContext context) {
    const double leftPadding = 16;
    return Container(
      width: 562,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              left: hasTitlePadding ? leftPadding : 0,
              top: hasTitlePadding ? 30 : 0,
            ),
            child: Text(
              'Reward Points',
              style: TextStyle(fontSize: 22, color: const Color(0xff244857), fontWeight: FontWeight.w100),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: leftPadding, top: 24, right: 20, bottom: 20),
            height: hasTitlePadding ? 361 : 343,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'You Have:',
                      style: TextStyle(fontSize: 18, color: Color(0xff244857)),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16),
                    const Spacer(),
                    Text(
                      '$points ' + (points == 1 ? 'point' : 'points'),
                      style: TextStyle(fontSize:hasTitlePadding ? 26 : 36, color: const Color(0xff244857),fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'As our customer, you’re in for a surprise every day! from your favorite mobile promos to treats, there’s a world of wonderful rewards that awaits you!',
                  style: TextStyle(fontSize: 14, color: Color(0xff244857)),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <String>[R.assetsImagesImage1, R.assetsImagesImage2, R.assetsImagesImage3, R.assetsImagesImage4]
                        .map(
                          (String image) => Container(
                            padding: const EdgeInsets.only(top: 16),
                            width: 143,
                            height: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(image),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Go to Globe Rewards',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xff244857),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
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
