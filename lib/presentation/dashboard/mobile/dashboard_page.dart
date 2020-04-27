import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_state.dart';

import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:globe_one_poc_project/common/utils/datetime_converter.dart';
import 'package:globe_one_poc_project/common/utils/gb_converter.dart';

import 'package:globe_one_poc_project/common/utils/media_query_util.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/r.dart';

import 'widgets/mobile_payment_details_widget.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  AccountDetailsBloc _accountDetailsBloc;
  PaymentDetailsBloc _paymentDetailsBloc;
  DataUsageBloc _dataUsageBloc;

  Future<Null> _refresh() async {
    _dataUsageBloc.add(RefreshDataUsageEvent());
    _paymentDetailsBloc.add(RefreshPaymentDetailsEvent());
    return null;
  }

  @override
  void initState() {
    super.initState();
    _accountDetailsBloc = BlocProvider.of<AccountDetailsBloc>(context);
    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _dataUsageBloc = BlocProvider.of<DataUsageBloc>(context);

    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
  }

  var paymentAmountValue = '0';
  var dueDate = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Container(
            width: MediaQueryUtil.convertWidth(screenWidth, 59),
            height: MediaQueryUtil.convertHeight(screenHeight, 22),
            child: Image.asset(R.assetsIcGlobeBanner),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
              builder: (context, state) {
            String userName = '';
            if (state is AccountDetailsSuccessState) {
              userName = state.nameInfo.nameElement2;
            } else if (state is AccountDetailsFailures) {
              userName = 'NA';
            }

            return AccountDetailsWidget(
              userName: userName,
              userMobileNumber: "0917 123 4567",
              userDuoNumber: " | DUO 052654245",
            );
          }),
          RefreshIndicator(
            onRefresh: _refresh,
            color: Theme.of(context).primaryColor,
            child: Container(
              height: 620,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: MediaQueryUtil.convertHeight(screenHeight, 160),
                    child: CMSBannerWidget(
                      onPageSelected: (index) {
                        print(index);
                      },
                      onPageChange: (index) {
                        print(index);
                      },
                      pages: <Widget>[
                        Container(
                          color: Colors.orange,
                          height: 50,
                          child: FlutterLogo(colors: Colors.blue),
                        ),
                        Container(
                          color: Colors.orange,
                          height: 50,
                          child: FlutterLogo(
                              style: FlutterLogoStyle.stacked,
                              colors: Colors.red),
                        ),
                        Container(
                          color: Colors.orange,
                          height: 50,
                          child: FlutterLogo(
                              style: FlutterLogoStyle.horizontal,
                              colors: Colors.green),
                        ),
                      ],
                    ),
                  ),
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
                    }
                    return MobilePaymentDetailsWidget(
                      paymentAmountValue: '₱ $paymentAmountValue',
                      dueDate: dueDate,
                      payNowButtonOnPressed: () {},
                      viewBillButtonOnPressed: () {},
                    );
                  }),
                  BlocBuilder<DataUsageBloc, DataUsageState>(
                      builder: (context, state) {
                    var remainingData = '6.4 GB';
                    var dataAllocation = '10 GB';
                    var refillDate = 'Apr. 24';

                    if (state is DataUsageSuccessState) {
                        remainingData = GBConverter.convert(
                        double.parse(state.dataUsage[0].volumeRemaining));
                        dataAllocation = GBConverter.convert(
                        double.parse(state.dataUsage[0].totalAllocated));
                        refillDate = DateTimeConverter.convert(state.dataUsage[0].endDate);
                    }
                    return DataUsageWidget(
                      isMobile: true,
                      onRefresh: () =>
                          {_dataUsageBloc.add(RefreshDataUsageEvent())},
                      onAddMoreData: () => {},
                      onViewDetails: () => {},
                      cupLevelIndicator:
                          Image.asset('assets/duck_placeholder.png'),
                      time: '8:30 AM',
                      addMoreDataButtonColor: const Color(0xff009CDF),
                      cupIndicatorTextColor: const Color(0xff9B9B9B),
                      remainingData: remainingData,
                      dataAllocation: dataAllocation,
                      refillDate: refillDate,
                      textColor: const Color(0xff244857),
                    );
                  }),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}
