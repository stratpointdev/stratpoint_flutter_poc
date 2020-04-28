import 'package:flutter/material.dart';

class DataUsageWidget extends StatelessWidget {
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
    final TextStyle cupLevelIndicatorTextStyle = TextStyle(
      fontSize: 17,
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
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'As of today, $time',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('100%', style: cupLevelIndicatorTextStyle),
                    Text('—', style: cupLevelIndicatorTextStyle),
                    Text('50%', style: cupLevelIndicatorTextStyle),
                    Text('—', style: cupLevelIndicatorTextStyle),
                    Text('0%', style: cupLevelIndicatorTextStyle),
                  ],
                ),
                Spacer(),
                Container(
                  width: 140,
                  height: 190,
                  child: cupLevelIndicator,
                ),
                Spacer(),
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
                      child: Text(
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
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 36),
            Container(
              height: 40,
              child: RawMaterialButton(
                onPressed: onAddMoreData,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor: addMoreDataButtonColor,
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
              'This includes your main data, rollover data, and free app data allowance',
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
