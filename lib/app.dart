import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_bloc.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/data_usage_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/local/local_payment_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/payment_details_repository_impl.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/remote_payment_details_service.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/dashboard_page.dart'
if(dart.library.js) 'package:globe_one_poc_project/presentation/dashboard/web/dashboard_page.dart';
import 'application/dashboard/data_usage/bloc/data_usage_bloc.dart';


import 'common/utils/hex_to_int_converter.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiBlocProvider(
        providers: [
          BlocProvider<PaymentDetailBloc>(
            create: (context) => PaymentDetailBloc(PaymentDetailsRepositoryImpl(
                RemotePaymentDetailsService(), LocalPaymentDetailsService())),
          ),

          BlocProvider<DataUsageBloc>(
            create: (context) => DataUsageBloc(DataUsageRepositoryImpl(RemoteDataUsageService(),
                LocalDataUsageService())),
          ),
        ],
        child: MaterialApp(
          title: 'GlobePOC',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'FSElliotPro',
            secondaryHeaderColor: Colors.black,
            textSelectionHandleColor:
                Color(HexToIntConverter.convert("#007AFF")),
            textSelectionColor: Color(HexToIntConverter.convert("#001B58")),
            errorColor: Color(HexToIntConverter.convert("#E02020")),
            disabledColor: Color(HexToIntConverter.convert("#007AFF")),
            hintColor: Color(HexToIntConverter.convert("#A1A1A1")),
            primaryColor: Color(HexToIntConverter.convert("#0056BF")),
            accentColor: Colors.white,
          ),
          home: DashBoardPage(),
        ));
  }
}
