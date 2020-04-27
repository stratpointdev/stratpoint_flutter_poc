import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/common/utils/media_query_util.dart';

class DataUsageWidget extends StatelessWidget {
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

  const DataUsageWidget({
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
    final TextStyle cupLevelIndicatorTextStyle = TextStyle(
      fontSize: 17,
      color: cupIndicatorTextColor,
    );
    final TextStyle cupLevelIndicatorTextStyleMobile = TextStyle(
      fontFamily: 'FSElliotPro',
      fontSize: MediaQueryUtil.convertHeight(screenHeight, 12),
      color: cupIndicatorTextColor,
    );

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
                              fontSize: MediaQueryUtil.convertHeight(
                                  screenHeight, 14),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FSElliotPro',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.8),
                            )
                          : TextStyle(
                              color: textColor,
                              fontSize: 16,
                            ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'As of today, $time',
                      style: isMobile
                          ? TextStyle(
                              fontSize: MediaQueryUtil.convertHeight(
                                  screenHeight, 10),
                              color: Theme.of(context).hintColor,
                            )
                          : TextStyle(
                              color: textColor,
                              fontSize: 12,
                            ),
                    ),
                  ],
                ),
                Center(
                  child: isMobile
                      ? null
                      : SizedBox(
                          height: 24,
                          width: 24,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: onRefresh,
                            icon: Icon(Icons.refresh), // TODO: Change Icon
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('100%',
                          style: isMobile
                              ? cupLevelIndicatorTextStyleMobile
                              : cupLevelIndicatorTextStyle),
                      Text('—',
                          style: isMobile
                              ? cupLevelIndicatorTextStyleMobile
                              : cupLevelIndicatorTextStyle),
                      Text('50%',
                          style: isMobile
                              ? cupLevelIndicatorTextStyleMobile
                              : cupLevelIndicatorTextStyle),
                      Text('—',
                          style: isMobile
                              ? cupLevelIndicatorTextStyleMobile
                              : cupLevelIndicatorTextStyle),
                      Text('0%',
                          style: isMobile
                              ? cupLevelIndicatorTextStyleMobile
                              : cupLevelIndicatorTextStyle),
                    ],
                  ),
                  Expanded(child: Container()),
                  // TODO: Change to Ratio depending on Screen Size?
                  Container(
                    width: isMobile
                        ? MediaQueryUtil.convertWidth(screenWidth, 85)
                        : 140,
                    height: isMobile
                        ? MediaQueryUtil.convertHeight(screenHeight, 117)
                        : 190,
                    child: cupLevelIndicator,
                  ),
                  Expanded(child: Container()),
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
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Refills on $refillDate',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
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
      ),
    );
  }
}
