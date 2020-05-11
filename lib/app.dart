import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_bloc.dart';

import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/infrastructure/cache_configuration/cache_configuration_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/local/local_account_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/cms_banner_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/data_usage_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/local/local_payment_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/payment_details_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/remote_payment_details_service.dart';

//condition whether to use package for web or for mobile.
import 'package:globe_one_poc_project/presentation/dashboard/mobile/dashboard_page.dart'
    if (dart.library.js) 'package:globe_one_poc_project/presentation/dashboard/web/dashboard_page.dart';

import 'application/dashboard/account_details/account_details_bloc.dart';
import 'application/dashboard/data_usage/data_usage_bloc.dart';
import 'infrastructure/dashboard/account_details/account_details_repository_impl.dart';
import 'infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';
import 'infrastructure/dashboard/cms_banner/local/local_cms_banner_service.dart';
import 'infrastructure/dashboard/cms_banner/remote/remote_cms_banner_service.dart';
import 'infrastructure/dashboard/data_usage/data_usage_repository_impl.dart';
import 'infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        BlocProvider<PaymentDetailsBloc>(
          create: (BuildContext context) => PaymentDetailsBloc(
              PaymentDetailsRepositoryImpl(
                  RemotePaymentDetailsService(),
                  LocalPaymentDetailsService(),
                  CacheConfigurationRepositoryImpl())),
        ),
        BlocProvider<AccountDetailsBloc>(
          create: (BuildContext context) => AccountDetailsBloc(
              AccountDetailsRepositoryImpl(
                  RemoteAccountDetailsService(),
                  LocalAccountDetailsService(),
                  CacheConfigurationRepositoryImpl())),
        ),
        BlocProvider<DataUsageBloc>(
          create: (BuildContext context) => DataUsageBloc(
              DataUsageRepositoryImpl(RemoteDataUsageService(),
                  LocalDataUsageService(), CacheConfigurationRepositoryImpl())),
        ),
        BlocProvider<CmsBannerBloc>(
          create: (BuildContext context) => CmsBannerBloc(
              CmsBannerRepositoryImpl(RemoteCmsBannerService(),
                  LocalCmsBannerService(), CacheConfigurationRepositoryImpl())),
        ),
      ],
      child: MaterialApp(
        title: 'GlobePOC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'FSElliotPro',
          secondaryHeaderColor: Colors.black,
          textSelectionHandleColor: const Color(0xff007AFF),
          textSelectionColor: const Color(0xff001B58),
          errorColor: const Color(0xffE02020),
          disabledColor: const Color(0xff007AFF),
          hintColor: const Color(0xff7F7F7F),
          primaryColor: const Color(0xff0056BF),
          accentColor: Colors.white,
        ),
        home: DashBoardPage(),
      ),
    );
  }
}
