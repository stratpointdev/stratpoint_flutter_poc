import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/common/utils/kb_converter.dart';
import 'package:globe_one_poc_project/presentation/dashboard/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/account_desktop_dashboard.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/desktop_header_menu.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/desktop_menu.dart';
import 'package:globe_one_poc_project/presentation/dashboard/web/widgets/desktop_load_rewards.dart';

import 'package:flutter/material.dart';

import 'widgets/desktop_header.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  DataUsageBloc _dataUsageBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataUsageBloc = BlocProvider.of<DataUsageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
         child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DesktopHeaderMenu(),
                    DesktopHeader(),
                    AccountDesktopDashboard(
                      profile: "Samantha",
                      mobile: "0918 XXXX XXXX",
                      duoNumber: "(02) 2920118",
                      profilePicture: "https://i.imgur.com/BoN9kdC.png",
                    ),
                    DesktopMenu(),


                    DesktopLoadRewards(),



                    BlocBuilder<DataUsageBloc, DataUsageState>(
              builder: (context, state) {
                var remainingData = '6.4 GB';
                var dataAllocation = '10 GB';
                var refillDate = 'Apr. 24';

                if (state is DataUsageSuccessState) {
                  remainingData = KBConverter.convert(double.parse(state.dataUsage.volumeRemaining));
                  dataAllocation = KBConverter.convert(double.parse(state.dataUsage.totalAllocated));
                  refillDate = state.dataUsage.endDate;
                }
                return DataUsageWidget(
                  onRefresh: () => {_dataUsageBloc.add(RefreshDataUsageEvent())},
                  onAddMoreData: () => {},
                  onViewDetails: () => {},
                  cupLevelIndicator: Image.asset('assets/duck_placeholder.png'),
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
                )
              ],
            ),
          )
      ),
    );
  }
}
