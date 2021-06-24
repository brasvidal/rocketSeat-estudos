import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/bar_code_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/login/login_page.dart';

import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp

      
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/splash': (context) => SplashPage(),
        '/barcode_scanner': (context) => BarcodeScannerPage(),
        '/insert_boleto': (context) => InsertBoletoPage(),
      },
    );
  }
}
