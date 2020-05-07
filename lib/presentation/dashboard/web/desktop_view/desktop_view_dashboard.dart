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
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/cms_banner_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/desktop_view/widgets/desktop_view_header.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/spending_limit.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';

import '../../../../r.dart';
import 'widgets/desktop_view_account_details.dart';
import 'widgets/desktop_view_header_menu.dart';
import 'widgets/desktop_view_load_rewards.dart';

import 'widgets/desktop_view_menu.dart';
import 'widgets/desktop_view_plan_detaiils.dart';

class DesktopViewDashboard extends StatefulWidget {
  @override
  _DesktopViewDashboardState createState() => _DesktopViewDashboardState();
}

class _DesktopViewDashboardState extends State<DesktopViewDashboard> {
  AccountDetailsBloc _accountDetailsBloc;
  DataUsageBloc _dataUsageBloc;
  CmsBannerBloc _cmsBannerBloc;
  String remainingData;
  String dataAllocation;
  String refillDate;
  Widget cupLevelIndicator;
  String lastApiCall;
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
    _cmsBannerBloc = BlocProvider.of<CmsBannerBloc>(context);
    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
    _cmsBannerBloc.add(InitialCmsBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffD2D8DB),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const DesktopViewHeaderMenu(),
              const DesktopViewHeader(),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffE4E8E8),
                padding: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 57),
                  child: Text(
                    'GLOBEONE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
                  builder: (BuildContext context, AccountDetailsState state) {
                String userName = '';
                if (state is AccountDetailsSuccessState) {
                  userName = state.nameInfo.nameElement2;
                } else if (state is AccountDetailsFailures) {
                  userName = 'NA';
                }
                return DesktopViewAccountDetails(
                  profile: userName,
                  mobile: '0917 123 4567',
                  duoNumber: '(05) 2654245',
                  profilePicture: 'https://i.imgur.com/BoN9kdC.png',
                );
              }),
              const DesktopViewMenu(),
              BlocBuilder<CmsBannerBloc, CmsBannerState>(
                  builder: (BuildContext context, CmsBannerState state) {
                if (state is CmsBannerLoadingState) {
                  return const ProgressIndicatorWidget();
                } else if (state is CmsBannerSuccessState) {
                  return CMSBannerWidget(
                    onPageSelected: () {},
                    onPageChange: () {},
                    imagePaths: state.imagePaths,
                    imageLinks: state.imageLinks,
                  );
                } else {
                  return Container();
                }
              }),
              const DesktopViewLoadRewards(),
              const SizedBox(height: 12),
              Container(
                child: Row(
                  children: <Widget>[
                    const Spacer(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: BlocBuilder<DataUsageBloc, DataUsageState>(builder:
                          (BuildContext context, DataUsageState state) {
                        if (state is DataUsageLoadingState)
                          return Container(
                              width: 437,
                              height: 539,
                              child: const Center(
                                  child: ProgressIndicatorWidget()));

                        if (state is DataUsageSuccessState) {
                          remainingData = state.volumeRemaing;
                          dataAllocation = state.totalAllocated;
                          refillDate = state.endDate;
                          cupLevelIndicator = state.cupLevelIndicator;
                          lastApiCall = state.lastApiCall;
                        }

                        return DataUsageWidget(
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
                      }),
                    ),
                    const SizedBox(width: 12),
                    const Padding(
                      padding: EdgeInsets.only(top: 65.0),
                      child: SpendingLimitWidget(),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 38.0),
                width: 1138,
                child: DesktopViewPlanDetails(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
