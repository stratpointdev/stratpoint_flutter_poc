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

import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget_mobile.dart';
import 'package:globe_one_poc_project/presentation/dashboard/widgets/progress_indicator_widget.dart';
import 'package:globe_one_poc_project/presentation/presentation_util/media_query_util.dart';
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
  var remainingData = '6.4 GB';
  var dataAllocation = '10 GB';
  var refillDate = 'Apr. 24';
  var paymentAmountValue = '0';
  var dueDate = '';
  var cupLevelIndicator = Image.asset(R.assetsDuckPlaceholder) ;
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
              height: MediaQueryUtil.convertHeight(screenHeight, 558.9),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // Container(
                  //   height: MediaQueryUtil.convertHeight(screenHeight, 160),
                  //   child: CMSBannerWidget(
                  //     onPageSelected: (index) {
                  //       print(index);
                  //     },
                  //     onPageChange: (index) {
                  //       print(index);
                  //     },
                  //     pages: <Widget>[
                  //       Container(
                  //         color: Colors.orange,
                  //         height: 50,
                  //         child: FlutterLogo(colors: Colors.blue),
                  //       ),
                  //       Container(
                  //         color: Colors.orange,
                  //         height: 50,
                  //         child: FlutterLogo(
                  //             style: FlutterLogoStyle.stacked,
                  //             colors: Colors.red),
                  //       ),
                  //       Container(
                  //         color: Colors.orange,
                  //         height: 50,
                  //         child: FlutterLogo(
                  //             style: FlutterLogoStyle.horizontal,
                  //             colors: Colors.green),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
                      builder: (context, state) {
                    if (state is PaymentDetailsSuccessState) {
                      paymentAmountValue = state.paymentAmountValue;
                      dueDate = state.dueDate;
                    }
                    if (state is PaymentDetailsLoadingState) {
                      return ProgressIndicatorWidget();
                    }
                    return MobilePaymentDetailsWidget(
                      paymentAmountValue: paymentAmountValue,
                      dueDate: dueDate,
                      payNowButtonOnPressed: () {},
                      viewBillButtonOnPressed: () {},
                    );
                  }),
                  Container(
                    color: Color(0xffD4D4D4),
                    height: 1,
                  ),
                  BlocBuilder<DataUsageBloc, DataUsageState>(
                      builder: (context, state) {

                    if (state is DataUsageSuccessState) {
                        remainingData = state.volumeRemaing;
                        dataAllocation = state.totalAllocated;
                        refillDate = state.endDate;
                        cupLevelIndicator = state.cupLevelIndicator;

                    }
                    if (state is DataUsageLoadingState) {
                      return ProgressIndicatorWidget();
                    }

                    return DataUsageWidgetMobile(
                      isMobile: true,
                      onRefresh: () =>
                          {_dataUsageBloc.add(RefreshDataUsageEvent())},
                      onAddMoreData: () => {},
                      onViewDetails: () => {},
                      cupLevelIndicator: cupLevelIndicator,
                      time: '8:30 AM',
                      addMoreDataButtonColor: const Color(0xff009CDF),
                      cupIndicatorTextColor: const Color(0xff9B9B9B),
                      remainingData: remainingData,
                      dataAllocation: dataAllocation,
                      refillDate: refillDate,
                      textColor: const Color(0xff244857),
                    );
                  }),
                  Container(
                    child: Image.asset('assets/rest_of_screen.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
