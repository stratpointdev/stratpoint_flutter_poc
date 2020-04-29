import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/presentation_util/media_query_util.dart';

class DataUsageWidgetMobile extends StatelessWidget {
  final bool isMobile;
  final String time;
  final String remainingData;
  final String dataAllocation;
  final String refillDate;
  final Color textColor;
  final Color cupIndicatorTextColor;
  final Color addMoreDataButtonColor;
  final Widget cupLevelIndicator;
  final EdgeInsetsGeometry padding;
  final VoidCallback onRefresh;
  final VoidCallback onAddMoreData;
  final VoidCallback onViewDetails;

  const DataUsageWidgetMobile({
    this.isMobile = false,
    @required this.time,
    @required this.remainingData,
    @required this.dataAllocation,
    @required this.refillDate,
    this.textColor = const Color(0xff244857),
    this.addMoreDataButtonColor = const Color(0xff009CDF),
    this.cupIndicatorTextColor = const Color(0xff9B9B9B),
    this.padding = const EdgeInsets.fromLTRB(16, 20, 16, 35),
    @required this.cupLevelIndicator,
    @required this.onRefresh,
    @required this.onAddMoreData,
    @required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // final TextStyle cupLevelIndicatorTextStyle = TextStyle(
    //   fontSize: 17,
    //   color: cupIndicatorTextColor,
    // );
    // final TextStyle cupLevelIndicatorTextStyleMobile = TextStyle(
    //   fontFamily: 'FSElliotPro',
    //   fontSize: MediaQueryUtil.convertHeight(screenHeight, 12),
    //   color: cupIndicatorTextColor,
    // );


    return IntrinsicHeight(
        child: Container(
      padding: padding,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Data Allowance',
                    style: isMobile
                        ? TextStyle(
                            fontSize:
                                MediaQueryUtil.convertHeight(screenHeight, 14),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'FSElliotPro',
                            color: Color(0xff019CDE),
                          )
                        : TextStyle(
                            color: textColor,
                            fontSize: 16,
                          ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'as of today, $time',
                    style: isMobile
                        ? TextStyle(
                            fontSize:
                                MediaQueryUtil.convertHeight(screenHeight, 10),
                            color: Theme.of(context).hintColor,
                          )
                        : TextStyle(
                            color: textColor,
                            fontSize: 12,
                          ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 36),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: isMobile
                      ? MediaQueryUtil.convertWidth(screenWidth, 110)
                      : 140,
                  height: isMobile
                      ? MediaQueryUtil.convertHeight(screenHeight, 120)
                      : 190,
                  child: cupLevelIndicator,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$remainingData LEFT',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Out of $dataAllocation',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Refills on $refillDate',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RawMaterialButton(
                      onPressed: onViewDetails,
                      child: isMobile
                          ? Text(
                              'View Details >',
                              style: TextStyle(
                                  fontSize: MediaQueryUtil.convertHeight(
                                      screenHeight, 11),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff007CB5)),
                            )
                          : Text(
                              'View Details',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Container(
            height: 40,
            child: RawMaterialButton(
              onPressed: onAddMoreData,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              fillColor: isMobile
                  ? Theme.of(context).primaryColor
                  : addMoreDataButtonColor,
              child: Center(
                child: Text(
                  'Add More Data',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            isMobile
                ? ""
                : 'This includes your main data, rollover data, and free app data allowance',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
    ));
  }
}