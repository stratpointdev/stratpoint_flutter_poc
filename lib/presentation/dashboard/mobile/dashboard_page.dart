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
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';
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
  CmsBannerBloc _cmsBannerBloc;

  Future<void> _refresh() async {
    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
    _cmsBannerBloc.add(InitialCmsBannerEvent());

  }

  @override
  void initState() {
    super.initState();

    _accountDetailsBloc = BlocProvider.of<AccountDetailsBloc>(context);
    _paymentDetailsBloc = BlocProvider.of<PaymentDetailsBloc>(context);
    _dataUsageBloc = BlocProvider.of<DataUsageBloc>(context);
    _cmsBannerBloc = BlocProvider.of<CmsBannerBloc>(context);

    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _paymentDetailsBloc.add(InitialPaymentDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
    _cmsBannerBloc.add(InitialCmsBannerEvent());
  }

  String remainingData = '6.4 GB';
  String dataAllocation = '10 GB';
  String refillDate = 'Apr. 24';
  String paymentAmountValue = '0';
  String dueDate = '';
  Image cupLevelIndicator = Image.asset(R.assetsDuckPlaceholder);
  String lastApiCall = '8:30 AM';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
              builder: (BuildContext context, AccountDetailsState state) {
            String userName = '';
            String mobileNumber = '';
            if (state is AccountDetailsSuccessState) {
              userName = state.nameInfo.nameElement2;
              mobileNumber = '0' + state.subscriberGeneralInfo.primResourceVal;
            } else if (state is AccountDetailsFailures) {
              userName = 'NA';
              mobileNumber = 'NA';
            }

            return AccountDetailsWidget(
              userName: userName,
              userMobileNumber: mobileNumber,
              userDuoNumber: ' | DUO 052654245',
            );
          }),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              key: const Key('refreshIndicatorWidget'),
              color: Theme.of(context).primaryColor,
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      width: MediaQueryUtil.convertWidth(screenWidth, 320),
                      height: MediaQueryUtil.convertHeight(screenHeight, 102),
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
                            imagePaths: state.imagePaths,
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
                    BlocBuilder<PaymentDetailsBloc, PaymentDetailsState>(
                        builder:
                            (BuildContext context, PaymentDetailsState state) {
                      if (state is PaymentDetailsSuccessState) {
                        paymentAmountValue = state.paymentAmountValue;
                        dueDate = state.dueDate;
                      }
                      if (state is PaymentDetailsLoadingState) {
                        return const ProgressIndicatorWidget();
                      }
                      if (state is PaymentDetailsFailedState) {
                        return Center(
                          child: Container(
                              height: 100, child: Icon(Icons.error_outline)),
                        );
                      }
                      return MobilePaymentDetailsWidget(
                        paymentAmountValue: paymentAmountValue,
                        dueDate: dueDate,
                        payNowButtonOnPressed: () {},
                        viewBillButtonOnPressed: () {},
                      );
                    }),
                    Container(
                      color: const Color(0xffD4D4D4),
                      height: 1,
                    ),
                    BlocBuilder<DataUsageBloc, DataUsageState>(
                        builder: (BuildContext context, DataUsageState state) {
                      if (state is DataUsageSuccessState) {
                        remainingData = state.remainingData;
                        dataAllocation = state.dataAllocation;
                        refillDate = state.refillDate;
                        cupLevelIndicator = state.cupLevelIndicator;
                        lastApiCall = state.lastAPICall;
                      }
                      if (state is DataUsageLoadingState) {
                        return const ProgressIndicatorWidget();
                      }
                      if (state is DataUsageFailedState) {
                        return Center(
                          child: Container(
                              height: 100, child: Icon(Icons.error_outline)),
                        );
                      }

                      return DataUsageWidget(
                        isMobile: true,
                        onRefresh: () {
                          _dataUsageBloc.add(RefreshDataUsageEvent());
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
                    }),
                    Container(
                      child: Image.asset('assets/rest_of_screen.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
