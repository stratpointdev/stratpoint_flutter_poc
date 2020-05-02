import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/desktop_view/widgets/bill_payment.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';


class DesktopLoadRewards extends StatefulWidget {
  const DesktopLoadRewards();

  @override
  _DesktopLoadRewards createState() => _DesktopLoadRewards();
}

class _DesktopLoadRewards extends State<DesktopLoadRewards> {
  PaymentDetailsBloc _paymentDetailsBloc;

  @override
  void initState() {
    super.initState();
    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
  }
  GlobalKey loadBalanceKey= GlobalKey<FormState>();
  var paymentAmountValue = '₱2,327.03';
  var dueDate = 'Mar. 30 2020, 4:00 PM';
  var lastPaymentAmount = '₱200.00';
  var lastPaymentDate = 'Apr 22';
  var dateNow = 'Apr. 28 2020';

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Row(
        children: <Widget>[
          Spacer(),
          BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
              builder: (context, state) {
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


            if(state is PaymentDetailsLoadingState)
              return Container(
                  color:  Color(0xffD2D8DB),
                  height: 420,
                  width: 562,
                  child: Center(child: ProgressIndicatorWidget()));

              return  BillPayment(
                  key : loadBalanceKey,
                  paymentAmountValue: paymentAmountValue,
                  dueDate: dueDate,
                  lastPaymentAmount: lastPaymentAmount,
                  lastPaymentDate: lastPaymentDate,
                  dateNow: dateNow,
                  onRefresh: () =>
                      {_paymentDetailsBloc.add(InitialPaymentDetailsEvent())},
                );


          }),
          SizedBox(width: 12),
          RewardPointsWidget(),
          Spacer()
        ],
      ),
    );
  }
}
