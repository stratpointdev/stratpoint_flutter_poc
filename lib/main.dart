import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'app.dart';
import 'infrastructure/dashboard/authentication/storage_util.dart';


Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  if(kIsWeb)
  await StorageUtil.getInstance();

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
