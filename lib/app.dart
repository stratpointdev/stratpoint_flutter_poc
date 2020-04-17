import 'package:finished_notes_firebase_ddd_course/presentation/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'application/login/bloc/login_bloc.dart';
import 'common/utils/hex_to_int_converter.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),

      ],
          child: MaterialApp(
            title: 'ALE',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Roboto',
              secondaryHeaderColor: Colors.black,

              textSelectionHandleColor: Color(
                  HexToIntConverter.convert("#007AFF")),
              textSelectionColor: Color(HexToIntConverter.convert("#001B58")),
              errorColor: Color(HexToIntConverter.convert("#E02020")),
              hintColor: Color(HexToIntConverter.convert("#CCCCCC")),
              disabledColor: Color(HexToIntConverter.convert("#007AFF")),
              primaryColor: Color(HexToIntConverter.convert("#0077E4")),
              accentColor: Colors.white,
            ),
            home: LoginPage(),
          )
      ),
      ),);
  }
}