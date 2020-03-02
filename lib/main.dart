import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/data.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/states/homepage/homepage.dart';
import 'package:wizard_app/states/newPolicy/1_newPolicyType.dart';
import 'package:wizard_app/states/newPolicy/2_newPolicyProduct.dart';
import 'package:wizard_app/states/newPolicy/3_newPolicyCovers.dart';
import 'package:wizard_app/states/newPolicy/4_newPolicyYou.dart';
import 'package:wizard_app/states/newPolicy/5_newPolicySubject.dart';

void main() {
  commonData.initialize().then((data) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          DataService.getAccountInfo().then((value) {
            processData.account = value;
          });
          return MyHomePage(DataService.getPolicies());
        },
        '/newPolicyType': (context) => NewPolicyType(),
        '/newPolicyProduct': (context) => NewPolicyProduct(),
        '/newPolicyCovers': (context) => NewPolicyCovers(),
        '/newPolicyYou': (context) => NewPolicyYou(),
        '/newPolicySubject': (context) => NewPolicySubject(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          // Custom swatch:

          // primarySwatch: MaterialColor(
          //   0xFFAAC107,
          //   <int, Color>{
          //     50: Color(0xFFAAF8E1),
          //     100: Color(0xFFAAECB3),
          //     200: Color(0xFFAAE082),
          //     300: Color(0xFFAAD54F),
          //     400: Color(0xFFAACA28),
          //     500: Color(0xFFAAC107),
          //     600: Color(0xFFAAB300),
          //     700: Color(0xFFAAA000),
          //     800: Color(0xFFAA8F00),
          //     900: Color(0xFFAA6F00),
          //   },
          // ),
          accentColor: Colors.lightBlueAccent),
    );
  }
}
