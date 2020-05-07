import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/r.dart';

void main() {
  testWidgets('DataUsageWidget should display Data Plan Details',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DataUsageWidget(
          time: '3:09 PM',
          remainingData: '8.0 GB',
          dataAllocation: '10.0 GB',
          refillDate: 'May 15',
          cupLevelIndicator: Image.asset(R.assetsImagesDuck5),
          onRefresh: () {},
          onAddMoreData: () {},
          onViewDetails: () {}),
    ));

    expect(find.text('as of today, 3:09 PM'), findsOneWidget);
    expect(find.text('Refills on May 15'), findsOneWidget);
    expect(find.text('8.0 GB LEFT'), findsOneWidget);
    expect(find.text('Out of 10.0 GB'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
