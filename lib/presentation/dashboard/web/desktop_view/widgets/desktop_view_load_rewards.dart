import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/desktop_view/widgets/desktop_view_bill_payment.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';

class DesktopViewLoadRewards extends StatefulWidget {
  const DesktopViewLoadRewards();

  @override
  _DesktopViewLoadRewards createState() => _DesktopViewLoadRewards();
}

class _DesktopViewLoadRewards extends State<DesktopViewLoadRewards> {
  PaymentDetailsBloc _paymentDetailsBloc;

  @override
  void initState() {
    super.initState();
    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
  }

  GlobalKey loadBalanceKey = GlobalKey<FormState>();
  String paymentAmountValue = '₱2,327.03';
  String dueDate = 'Mar. 30 2020, 4:00 PM';
  String lastPaymentAmount = '₱200.00';
  String lastPaymentDate = 'Apr 22';
  String dateNow = 'Apr. 28 2020';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          const Spacer(),
          BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
              builder: (BuildContext context, PaymentDetailsState state) {
            if (state is PaymentDetailsSuccessState) {
              paymentAmountValue = state.paymentAmountValue;
              dueDate = state.dueDate;
              lastPaymentAmount = state.lastPaymentAmount;
              lastPaymentDate = state.lastPaymentDate;
              dateNow = state.dateNow;
              print(paymentAmountValue);
              print(dueDate);
              print(lastPaymentAmount);
              print(lastPaymentDate);
              print(dateNow);
            }

            if (state is PaymentDetailsLoadingState)
              return Container(
                  color: const Color(0xffD2D8DB),
                  height: 382,
                  width: 562,
                  child: const Center(child: ProgressIndicatorWidget()));

            return DesktopViewBillPayment(
              key: loadBalanceKey,
              paymentAmountValue: paymentAmountValue,
              dueDate: dueDate,
              lastPaymentAmount: lastPaymentAmount,
              lastPaymentDate: lastPaymentDate,
              dateNow: dateNow,
              onRefresh: () =>
                  {_paymentDetailsBloc.add(InitialPaymentDetailsEvent())},
            );
          }),
          const SizedBox(width: 12),
          const RewardPointsWidget(),
          const Spacer()
        ],
      ),
    );
  }
}
