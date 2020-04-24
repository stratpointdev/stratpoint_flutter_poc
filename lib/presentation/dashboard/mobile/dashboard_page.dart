import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_state.dart';
import 'package:globe_one_poc_project/common/utils/media_query_util.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';

import 'widgets/mobile_payment_information_widget.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  AccountDetailsBloc _accountDetailsBloc;

  @override
  void initState() {
    super.initState();
    _accountDetailsBloc = BlocProvider.of<AccountDetailsBloc>(context);
    _accountDetailsBloc.add(RefreshAccountDetailsEvent());
  }

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
          BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
              builder: (context, state) {
            String userName = '';
            if (state is AccountDetailsSuccess) {
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
          MobilePaymentInformationWidget(
            paymentAmountValue: '₱ 1,798.03',
            dueDate: 'Due on May 13',
            payNowButtonOnPressed: () {},
            viewBillButtonOnPressed: () {},
          ),
          DataUsageWidget(
            onRefresh: () => {},
            onAddMoreData: () => {},
            onViewDetails: () => {},
            cupLevelIndicator: Image.asset('assets/duck_placeholder.png'),
            time: '8:30 AM',
            addMoreDataButtonColor: const Color(0xff009CDF),
            cupIndicatorTextColor: const Color(0xff9B9B9B),
            remainingData: '6.4 GB',
            dataAllocation: '10 GB',
            refillDate: 'Apr. 24',
            textColor: const Color(0xff244857),
          ),
        ],
      ),
    );
  }
}
