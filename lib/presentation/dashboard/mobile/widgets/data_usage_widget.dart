import 'package:flutter/material.dart';

class DataUsageWidget extends StatelessWidget {
  final String time;
  final String remainingData;
  final String dataAllocation;
  final String refillDate;
  final Color textColor;
  final Color cupIndicatorTextColor;
  final Color addMoreDataButtonColor;
  final Image levelImage;
  final EdgeInsetsGeometry padding;
  final VoidCallback onRefresh;
  final VoidCallback onAddMoreData;
  final VoidCallback onViewDetails;

  DataUsageWidget({
    @required this.time,
    @required this.remainingData,
    @required this.dataAllocation,
    @required this.refillDate,
    @required this.textColor,
    @required this.addMoreDataButtonColor,
    @required this.cupIndicatorTextColor,
    @required this.levelImage,
    @required this.onRefresh,
    @required this.onAddMoreData,
    @required this.onViewDetails,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle _cupIndicatorStyle = TextStyle(
      fontSize: 17,
      color: cupIndicatorTextColor,
    );

    Widget mainWidget = IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 35),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Data Allowance',
                      style: TextStyle(
                        color: textColor,
                        // fontWeight: FontWeight.bold,
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
                Expanded(child: Container()),
                SizedBox(
                  height: 14,
                  width: 14,
                  child: RawMaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => onRefresh,
                    child: Icon(Icons.refresh), // TODO: Change Icon
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('100%', style: _cupIndicatorStyle),
                      Text('—', style: _cupIndicatorStyle),
                      Text('50%', style: _cupIndicatorStyle),
                      Text('—', style: _cupIndicatorStyle),
                      Text('0%', style: _cupIndicatorStyle),
                    ],
                  ),
                  // const SizedBox(width: 8),
                  Expanded(child: Container()),
                  Container(
                    width: 140,
                    child: levelImage,
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
                        onPressed: () => onViewDetails,
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
            ),
            const SizedBox(height: 36),
            Container(
              height: 40,
              child: RawMaterialButton(
                onPressed: () => onAddMoreData,
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

    if (padding != null) {
      return Padding(
        padding: padding,
        child: mainWidget,
      );
    }
    return mainWidget;
  }
}
