
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import  'presentation/dashboard/web/DashboardProfile.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_bloc.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return  MultiBlocProvider(
            providers: [
              BlocProvider<PaymentDetailBloc>(
                create: (context) => PaymentDetailBloc(),
              ),
            ],
            child: MaterialApp(
              title: 'GlobePOC',
              debugShowCheckedModeBanner: false,

              home: DashboardProfile(profile: 'akeem',profilePicture: 'picture',mobile: '123',duoNumber: '456',),

            ));

  }
}
