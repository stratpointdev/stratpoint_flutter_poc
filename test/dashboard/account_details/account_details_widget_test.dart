import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';

void main() {
  testWidgets(
      'AccountDetailsWidget should display username, mobile number, and duo number',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AccountDetailsWidget(
        userName: 'foo',
        userMobileNumber: '09178512345',
        userDuoNumber: ' | DUO 09123456752',
      ),
    ));

    expect(find.text('foo'), findsOneWidget);
    expect(find.text('09178512345 | DUO 09123456752'), findsOneWidget);
  });
}
