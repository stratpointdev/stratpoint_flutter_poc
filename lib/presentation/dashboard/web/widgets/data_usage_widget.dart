import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';

class DataUsageWidget extends StatelessWidget {
  final GlobalKey key;
  final bool isMobileView;
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
    @required this.key,
    this.isMobileView: false,
    @required this.time,
    @required this.remainingData,
    @required this.dataAllocation,
    @required this.refillDate,
    this.textColor = const Color(0xff244857),
    this.addMoreDataButtonColor = const Color(0xff009CDF),
    this.cupIndicatorTextColor = const Color(0xff9B9B9B),
    this.padding = const EdgeInsets.fromLTRB(21, 24, 20, 35),
    @required this.cupLevelIndicator,
    @required this.onRefresh,
    @required this.onAddMoreData,
    @required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 437,
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 12.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: isMobileView ? 16 : 0,
                  ),
                  child: Text(
                    'Usage',
                    style: TextStyle(fontSize: 22, color: Color(0xff244857), fontWeight: FontWeight.w100),
                    textAlign: TextAlign.left,
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          BlocBuilder<DataUsageBloc, DataUsageState>(builder: (context, state) {
            return IntrinsicHeight(
              child: Container(
                height: isMobileView ? 374 : 500,
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
                                fontSize: isMobileView ? 16 :20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'As of today, $time',
                              style: TextStyle(
                                color: textColor,
                                fontSize: isMobileView ? 12 :14,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: onRefresh,
                          icon: Icon(Icons.refresh),
                        )
                      ],
                    ),
                    const SizedBox(height: 36),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: isMobileView ? 224 : 224,
                          height: isMobileView ? 122 : 180,
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
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff244857)),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Out of $dataAllocation',
                              style: TextStyle(
                                color: textColor,
                                fontSize: isMobileView ? 12 : 14,
                              ),
                            ),
                            Text(
                              'Refills on $refillDate',
                              style: TextStyle(
                                color: textColor,
                                fontSize:isMobileView ? 12:  14,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'View Details',
                              style: TextStyle(

                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff244857),),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 50),
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
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Text(
                        'This includes your main data, rollover data, and free app data allowance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );

          }),
        ],
      ),
    );

  }
}


