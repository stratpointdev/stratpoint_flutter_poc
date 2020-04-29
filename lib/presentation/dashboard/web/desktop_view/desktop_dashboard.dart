import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_state.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/data_usage_widget.dart';
import '../../../../r.dart';
import 'widgets/account_desktop_dashboard.dart';
import 'widgets/desktop_header_menu.dart';
import 'widgets/desktop_load_rewards.dart';

import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/widgets/progress_indicator_widget.dart';


import 'widgets/desktop_header.dart';
import 'widgets/desktop_menu.dart';

class DesktopDashboard extends StatefulWidget {
  @override
  _DesktopDashboardState createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  AccountDetailsBloc _accountDetailsBloc;

  DataUsageBloc _dataUsageBloc;
  var remainingData;
  var dataAllocation;
  var refillDate;
  var cupLevelIndicator;
  var lastApiCall;

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
    _accountDetailsBloc.add(InitialAccountDetailsEvent());
    _dataUsageBloc.add(InitialDataUsageEvent());
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
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
                /*    Container(
                  height: MediaQueryUtil.convertHeight(screenHeight, 100),
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
                ),*/
                DesktopLoadRewards(),
                Container(
                  alignment: Alignment.centerLeft,
                  width: screenWidth / 3.5,
                  child: BlocBuilder<DataUsageBloc, DataUsageState>(
                      builder: (context, state) {
                    if (state is DataUsageSuccessState) {
                      remainingData = state.volumeRemaing;
                      dataAllocation = state.totalAllocated;
                      refillDate = state.endDate;

                      cupLevelIndicator = state.cupLevelIndicator;
                      lastApiCall = state.lastApiCall;
                    }

                    if (state is DataUsageLoadingState) {
                      return ProgressIndicatorWidget();
                    }
                    return DataUsageWidget(
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
                  }),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
