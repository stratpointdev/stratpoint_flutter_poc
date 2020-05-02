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
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/presentation_util/media_query_util.dart';
import '../../../../r.dart';
import 'widgets/account_desktop_dashboard.dart';
import 'widgets/desktop_header_menu.dart';
import 'widgets/desktop_load_rewards.dart';

import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/common/progress_indicator_widget.dart';

import 'widgets/desktop_header.dart';
import 'widgets/desktop_menu.dart';
import 'widgets/plan_detaiils_dashboard.dart';
import 'widgets/spending_limit.dart';

class DesktopDashboard extends StatefulWidget {
  @override
  _DesktopDashboardState createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  AccountDetailsBloc _accountDetailsBloc;
  DataUsageBloc _dataUsageBloc;
  CmsBannerBloc _cmsBannerBloc;
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
    _cmsBannerBloc = BlocProvider.of<CmsBannerBloc>(context);
    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
    _cmsBannerBloc.add(InitialCmsBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color:  Color(0xffD2D8DB),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DesktopHeaderMenu(),
              DesktopHeader(),
              BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
                  builder: (context, state) {
                String userName = '';
                if (state is AccountDetailsSuccessState) {
                  userName = state.nameInfo.nameElement2;
                } else if (state is AccountDetailsFailures) {
                  userName = 'NA';
                }
                return AccountDesktopDashboard(
                  profile: userName,
                  mobile: "0918 XXXX XXXX",
                  duoNumber: "(02) 2920118",
                  profilePicture: "https://i.imgur.com/BoN9kdC.png",
                );
              }),
              DesktopMenu(),
              Container(
                height: 109,
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
              DesktopLoadRewards(),
              SizedBox(height: 12),
              Container(
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: BlocBuilder<DataUsageBloc, DataUsageState>(
                          builder: (context, state) {
                        if (state is DataUsageLoadingState)
                          return Container(
                              width: 437,
                              height: 500,
                              child:
                                  Center(child: ProgressIndicatorWidget()));

                        if (state is DataUsageSuccessState) {
                          remainingData = state.volumeRemaing;
                          dataAllocation = state.totalAllocated;
                          refillDate = state.endDate;

                          cupLevelIndicator = state.cupLevelIndicator;
                          lastApiCall = state.lastApiCall;
                        }

                        return DataUsageWidget(
                          key: dataUsageKey,
                          onRefresh: () =>
                              {_dataUsageBloc.add(InitialDataUsageEvent())},
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
                      }),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top:65.0),
                      child: SpendingLimitWidget(),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 38.0),
                width: 1138,
                child: PlanDetailsWidget(),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
