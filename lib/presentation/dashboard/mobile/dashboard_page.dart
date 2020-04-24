import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/bloc/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/bloc/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/bloc/data_usage_state.dart';
import 'package:globe_one_poc_project/common/utils/kb_converter.dart';
import 'package:globe_one_poc_project/common/utils/media_query_util.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';

import 'widgets/mobile_payment_information_widget.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  DataUsageBloc dataUsageBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataUsageBloc = BlocProvider.of<DataUsageBloc>(context);
  }

  var remainingData = '6.4 GB';
  var dataAllocation = '10 GB';
  var refillDate = 'Apr. 24';

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
            child: Image.asset("assets/ic_globe_banner.png"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          AccountDetailsWidget(),
          MobilePaymentInformationWidget(
            paymentAmountValue: '₱ 1,798.03',
            dueDate: 'Due on May 13',
            payNowButtonOnPressed: () {},
            viewBillButtonOnPressed: () {},
          ),

          BlocListener<DataUsageBloc, DataUsageState>(
              listener: (context,state){
                if(state is SuccessState){
                  remainingData = KBConverter.convert(double.parse(state.dataUsage.volumeRemaining));
                  dataAllocation  = KBConverter.convert(double.parse(state.dataUsage.totalAllocated));
                  refillDate = state.dataUsage.endDate;
                }
              },
              child: BlocBuilder<DataUsageBloc, DataUsageState>(
                  builder: (context, state) {
                    return DataUsageWidget(
                      onRefresh: () => {dataUsageBloc.add(RefreshEvent())},
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
                  }
              )
          ),
        ],
      ),
    );
  }
}
