import 'dart:io';
import 'package:flutter/material.dart';
import 'app.dart';
import 'infrastructure/dashboard/authentication/storage_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //if(kIsWeb)
  await StorageUtil.getInstance();
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
