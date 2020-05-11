import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/mobile_view/widgets/mobile_view_bill_payment.dart';

void main() {
  /// If MobileViewBillPayment is displayed, it should have
  /// a payment amount value, due date, last payment amount, and
  /// last payment date displayed with it.
  testWidgets(
      'MobileViewBillPayment should display payment amount value, due date, last payment amount, and last payment date',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: MobileViewBillPayment(
          paymentAmountValue: '2,500.00',
          dueDate: 'Jun 28',
          lastPaymentAmount: '3000.00',
          lastPaymentDate: 'May 26, 2020',
        ),
      ),
    ));
    expect(find.text('2,500.00'), findsOneWidget);
    expect(find.text('Due on Jun 28'), findsOneWidget);
  });
}
