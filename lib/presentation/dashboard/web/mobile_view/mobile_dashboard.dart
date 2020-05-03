import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_state.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_event.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_state.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';

import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/desktop_view/widgets/spending_limit.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/mobile_view/widgets/mobile_bill_payment.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';

import '../../../../r.dart';
import 'widgets/account_mobile_dashboard.dart';
import 'widgets/mobile_header.dart';
import 'widgets/mobile_menu.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard();

  @override
  _MobileDashboard createState() => _MobileDashboard();
}

class _MobileDashboard extends State<MobileDashboard> {
  AccountDetailsBloc _accountDetailsBloc;
  CmsBannerBloc _cmsBannerBloc;
  PaymentDetailsBloc _paymentDetailsBloc;
  var paymentAmountValue = '₱2,327.03';
  var dueDate = 'Mar. 30 2020, 4:00 PM';
  var lastPaymentAmount = '₱200.00';
  var lastPaymentDate = 'Apr 22';
  var dateNow = 'Apr. 28 2020';

  DataUsageBloc _dataUsageBloc;
  var remainingData;
  var dataAllocation;
  var refillDate;
  var cupLevelIndicator;
  var lastApiCall;
  GlobalKey dataUsageKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    remainingData = '6.4 GB';
    dataAllocation = '10 GB';
    refillDate = 'Apr. 24';
    cupLevelIndicator = Image.asset(R.assetsDuckPlaceholder);
    lastApiCall = '8:30 AM';

    _accountDetailsBloc = BlocProvider.of<AccountDetailsBloc>(context);
    _dataUsageBloc = BlocProvider.of<DataUsageBloc>(context);
    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _cmsBannerBloc = BlocProvider.of<CmsBannerBloc>(context);
    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
    _cmsBannerBloc.add(InitialCmsBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Color(0xffD2D8DB),
        child: ListView(
          children: <Widget>[
            MobileHeader(),
            BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
                builder: (context, state) {
                  String userName = '';
                  if (state is AccountDetailsSuccessState) {
                    userName = state.nameInfo.nameElement2;
                  } else if (state is AccountDetailsFailures) {
                    userName = 'NA';
                  }
                  return AccountMobileDashboard(
                    profile: userName,
                    mobile: "0918 XXXX XXXX",
                    duoNumber: "(02) 2920118",
                    profilePicture: "https://i.imgur.com/BoN9kdC.png",
                  );
                }),

            MobileMenu(),

            Container(
              height: 114,
              child: BlocBuilder<CmsBannerBloc, CmsBannerState>(
                  builder: (context, state) {
                    if (state is CmsBannerLoadingState) {
                      return ProgressIndicatorWidget();
                    } else if (state is CmsBannerSuccessState) {
                      return CMSBannerWidget(
                        onPageSelected: (index) {
                          print(index);
                        },
                        onPageChange: (index) {
                          print(index);
                        },
                        imagePaths: state.imagePaths,
                        imageLinks: state.imageLinks,
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
                builder: (context, state) {
                  if (state is PaymentDetailsSuccessState) {
                    paymentAmountValue = state.paymentAmountValue;
                    dueDate = state.dueDate;
                    dateNow = state.dateNow;
                  }

                  if(state is PaymentDetailsLoadingState)
                    return Container(
                        width:  MediaQuery.of(context).size.width,
                        child: Center(child: ProgressIndicatorWidget()));

                  return  MobileViewBillPayment(
                    paymentAmountValue: paymentAmountValue,
                    dueDate: dueDate,
                    dateNow: dateNow,
                    onRefresh: () =>
                    {_paymentDetailsBloc.add(RefreshPaymentDetailsEvent())},
                  );

                }),
            RewardPointsWidget(hasTitlePadding : true),
            BlocBuilder<DataUsageBloc, DataUsageState>(
              builder: (context, state) {
                if (state is DataUsageSuccessState) {
                  remainingData = state.volumeRemaing;
                  dataAllocation = state.totalAllocated;
                  refillDate = state.endDate;
                  cupLevelIndicator = state.cupLevelIndicator;
                  lastApiCall = state.lastApiCall;
                }

                if (state is DataUsageLoadingState)
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: ProgressIndicatorWidget()));

                return DataUsageWidget(
                  key: dataUsageKey,
                  isMobileView: true,
                  onRefresh: () =>
                      {_dataUsageBloc.add(RefreshDataUsageEvent())},
                  onAddMoreData: () => {},
                  onViewDetails: () => {},
                  cupLevelIndicator: cupLevelIndicator,
                  time: lastApiCall,
                  addMoreDataButtonColor: const Color(0xff009CDF),
                  cupIndicatorTextColor: const Color(0xff9B9B9B),
                  remainingData: remainingData,
                  dataAllocation: dataAllocation,
                  refillDate: refillDate,
                  textColor: const Color(0xff244857),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top :30.0),
              child: SpendingLimitWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
