
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/presentation/dashboard/mobile/dashboard_page.dart';
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
      child: CacheProvider(
        child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(),
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
            )),
      ),
    );
  }
}
