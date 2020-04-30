import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
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

  DataUsageBloc _dataUsageBloc;
  var remainingData;
  var dataAllocation;
  var refillDate;
  var cupLevelIndicator;
  var lastApiCall;
  GlobalKey dataUsageKey= GlobalKey<FormState>();
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
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Container(
          child: ListView(
            children: <Widget>[
             // MobileHeader(),
              AccountMobileDashboard(
                profile: "Samantha",
                mobile: "0918 XXXX XXXX",
                duoNumber: "(02) 2920118",
                profilePicture: "https://i.imgur.com/BoN9kdC.png",
              ),

              MobileMenu(),
              RewardPointsWidget(),
             BlocBuilder<DataUsageBloc, DataUsageState>(
                    builder: (context, state) {
                      if (state is DataUsageSuccessState) {
                        remainingData = state.volumeRemaing;
                        dataAllocation = state.totalAllocated;
                        refillDate = state.endDate;

                        cupLevelIndicator = state.cupLevelIndicator;
                        lastApiCall = state.lastApiCall;
                      }

                      if(state is DataUsageLoadingState)
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            child: Center(child: ProgressIndicatorWidget()));

                      return DataUsageWidget(
                        key: dataUsageKey,
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

              ],
            ),

      ),
    );
  }
}
