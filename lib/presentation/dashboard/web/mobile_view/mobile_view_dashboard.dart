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
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/mobile_view/widgets/mobile_view_bill_payment.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/mobile_view/widgets/mobile_view_plan_details.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/reward_points_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/spending_limit.dart';

import '../../../../r.dart';
import 'widgets/mobile_view_account_details.dart';
import 'widgets/mobile_view_header.dart';
import 'widgets/mobile_view_menu.dart';


// the main ui dashboard for web mobile view which display all widgets from web/mobile_view/widgets/
// and also handle the state for Account details,CMS Banner and Data Usage
class MobileDashboard extends StatefulWidget {
  const MobileDashboard();

  @override
  _MobileDashboard createState() => _MobileDashboard();
}

class _MobileDashboard extends State<MobileDashboard> {
  AccountDetailsBloc _accountDetailsBloc;
  CmsBannerBloc _cmsBannerBloc;
  PaymentDetailsBloc _paymentDetailsBloc;
  String paymentAmountValue = '₱2,327.03';
  String dueDate = 'Mar. 30 2020, 4:00 PM';
  String lastPaymentAmount = '₱200.00';
  String lastPaymentDate = 'Apr 22';
  String dateNow = 'Apr. 28 2020';

  DataUsageBloc _dataUsageBloc;
  String remainingData;
  String dataAllocation;
  String refillDate;
  Widget cupLevelIndicator;
  String lastApiCall;
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
        color: const Color(0xffE4E8E8),
        child: ListView(
          children: <Widget>[
            const MobileViewHeader(),
            BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
                builder: (BuildContext context, AccountDetailsState state) {
              String userName = '';
              String mobileNumber = '';
              if (state is AccountDetailsSuccessState) {
                userName = state.nameInfo.nameElement2;
                mobileNumber =
                    '0' + state.subscriberGeneralInfo.primResourceVal;
              } else if (state is AccountDetailsFailures) {
                userName = 'NA';
              }
              return MobileViewAccountDetails(
                profile: userName,
                mobile: mobileNumber,
                duoNumber: 'Duo 052654245',
                profilePicture: 'https://i.imgur.com/BoN9kdC.png',
              );
            }),
            const MobileViewMenu(),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 120,
              width: 320,
              child: BlocBuilder<CmsBannerBloc, CmsBannerState>(builder:
                  (BuildContext context, CmsBannerState state) {
                if (state is CmsBannerLoadingState) {
                  return const ProgressIndicatorWidget();
                } else if (state is CmsBannerSuccessState) {
                  return CMSBannerWidget(
                    onPageSelected: (int index) {
                      print(index);
                    },
                    onPageChange: (int index) {
                      print(index);
                    },
                    imageList: state.imageList,
                    imageLinks: state.imageLinks,
                  );
                } else if (state is CmsBannerFailedState) {
                  return Center(
                    child: Container(
                        height: 100, child: Icon(Icons.error_outline)),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
                builder: (BuildContext context, PaymentDetailsState state) {
              if (state is PaymentDetailsSuccessState) {
                paymentAmountValue = state.paymentAmountValue;
                dueDate = state.dueDate;
                dateNow = state.dateNow;
              }

              if (state is PaymentDetailsLoadingState)
                return Container(
                    height: 238,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: ProgressIndicatorWidget()));

              return MobileViewBillPayment(
                paymentAmountValue: paymentAmountValue,
                dueDate: dueDate,
                dateNow: dateNow,
                onRefresh: () {
                  _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
                },
              );
            }),
            const RewardPointsWidget(hasTitlePadding: true),
            BlocBuilder<DataUsageBloc, DataUsageState>(
              builder: (BuildContext context, DataUsageState state) {
                if (state is DataUsageSuccessState) {
                  remainingData = state.remainingData;
                  dataAllocation = state.dataAllocation;
                  refillDate = state.refillDate;
                  cupLevelIndicator = state.cupLevelIndicator;
                  lastApiCall = state.lastAPICall;
                }

                if (state is DataUsageLoadingState)
                  return Container(
                      height: 413,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(child: ProgressIndicatorWidget()));

                return DataUsageWidget(
                  isMobileView: true,
                  onRefresh: () {
                    _dataUsageBloc.add(InitialDataUsageEvent());
                  },
                  onAddMoreData: () {},
                  onViewDetails: () {},
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
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: SpendingLimitWidget(
                isMobileView: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: MobileViewPlanDetailsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
