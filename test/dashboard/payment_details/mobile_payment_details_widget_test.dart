import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/mobile_payment_details_widget.dart';

void main() {
  testWidgets(
      'MobilePaymentDetailsWidget should display payment amount and due date',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MobilePaymentDetailsWidget(
        paymentAmountValue: '2,500.00',
        dueDate: 'Jun 28',
      ),
    ));

    expect(find.text('2,500.00'), findsOneWidget);
    expect(find.text('Due on Jun 28'), findsOneWidget);
  });
}
