import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/common/utils/media_query_util.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/account_details_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/data_usage_widget.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/widgets/mobile_payment_information_widget.dart';

class DashBoardPage extends StatelessWidget {
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
            cupLevelIndicator: null,
          ),
        ],
      ),
    );
  }
}
