import 'package:globe_one_poc_project/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/login/bloc/login_bloc.dart';
import 'common/utils/hex_to_int_converter.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'POC',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            secondaryHeaderColor: Colors.black,
            textSelectionHandleColor:
                Color(HexToIntConverter.convert("#007AFF")),
            textSelectionColor: Color(HexToIntConverter.convert("#001B58")),
            errorColor: Color(HexToIntConverter.convert("#E02020")),
            hintColor: Color(HexToIntConverter.convert("#CCCCCC")),
            disabledColor: Color(HexToIntConverter.convert("#007AFF")),
            primaryColor: Color(HexToIntConverter.convert("#0077E4")),
            accentColor: Colors.white,
          ),
          home: LoginPage(),
        ));
  }
}
