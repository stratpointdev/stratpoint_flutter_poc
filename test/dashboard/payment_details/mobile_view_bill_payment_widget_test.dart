import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/mobile_view/widgets/mobile_view_bill_payment.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {
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
