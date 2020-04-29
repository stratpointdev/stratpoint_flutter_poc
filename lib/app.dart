import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/local/local_account_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/data_usage_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/local/local_payment_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/payment_details_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/remote_payment_details_service.dart';

import 'application/dashboard/data_usage/data_usage_bloc.dart';
import 'application/dashboard/account_details/account_details_bloc.dart';
import 'infrastructure/dashboard/account_details/account_details_repository_impl.dart';
import 'infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';
import 'infrastructure/dashboard/data_usage/data_usage_repository_impl.dart';
import 'infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

import 'package:globe_one_poc_project/presentation/dashboard/mobile/dashboard_page.dart'
    if (dart.library.js) 'package:globe_one_poc_project/presentation/dashboard/web/dashboard_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiBlocProvider(
      providers: [
        BlocProvider<PaymentDetailsBloc>(
          create: (context) => PaymentDetailsBloc(PaymentDetailsRepositoryImpl(
            RemotePaymentDetailsService(),
            LocalPaymentDetailsService(),
          )),
        ),
        BlocProvider<AccountDetailsBloc>(
          create: (context) => AccountDetailsBloc(AccountDetailsRepositoryImpl(
              RemoteAccountDetailsService(), LocalAccountDetailsService())),
        ),
        BlocProvider<DataUsageBloc>(
          create: (context) => DataUsageBloc(DataUsageRepositoryImpl(
            RemoteDataUsageService(),
            LocalDataUsageService(),
          )),
        ),
      ],
      child: MaterialApp(
        title: 'GlobePOC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'FSElliotPro',
          secondaryHeaderColor: Colors.black,
          textSelectionHandleColor: Color(0xff007AFF),
          textSelectionColor: Color(0xff001B58),
          errorColor: Color(0xffE02020),
          disabledColor: Color(0xff007AFF),
          hintColor: Color(0xffA1A1A1),
          primaryColor: Color(0xff0056BF),
          accentColor: Colors.white,
        ),
        home: DashBoardPage(),
      ),
    );
  }
}
