import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/load_balance.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points.dart';
import 'package:flutter/cupertino.dart';

class DesktopLoadRewards extends StatefulWidget {

  const DesktopLoadRewards();

  @override
  _DesktopLoadRewards createState() => _DesktopLoadRewards();

}

class _DesktopLoadRewards extends State<DesktopLoadRewards> {
  PaymentDetailsBloc _paymentDetailsBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
  }


  var paymentAmountValue = '0';
  var dueDate = '2020-03-31T00:00:00+0800';
  LastPaymentDt lastPaymentDt = new LastPaymentDt(paymentDate: '2020-03-31T00:00:00+0800',creditId: 0, amount: 0.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(),

          BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
              builder: (context, state) {
                if (state is PaymentDetailsSuccessState) {
                  paymentAmountValue = state
                      .paymentDetailsModel
                      .outstandingBalanceByMsisdnResponse
                      .outstandingBalanceByMsisdnResult
                      .overDueBalance
                      .toString();

                  dueDate = state
                      .paymentDetailsModel
                      .outstandingBalanceByMsisdnResponse
                      .outstandingBalanceByMsisdnResult
                      .overDueDate
                      .toString();

                  lastPaymentDt =  state
                      .paymentDetailsModel
                      .outstandingBalanceByMsisdnResponse
                      .outstandingBalanceByMsisdnResult
                      .lastPaymentDt;
                }
                return   LoadBalance(paymentAmountValue: paymentAmountValue ,
                  dueDate: dueDate,
                  lastPaymentDt: lastPaymentDt,
                  onRefresh: () => { _paymentDetailsBloc.add(RefreshPaymentDetailsEvent())},
                );
              }),

          RewardPoints(),

          Spacer()
        ],
      ),
    );
  }
}