import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/data.dart';
import 'package:wizard_app/services/helper.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/states/homepage/homepage.dart';
import 'package:wizard_app/states/newPolicy/1_newPolicyType.dart';
import 'package:wizard_app/states/newPolicy/2_newPolicyProduct.dart';
import 'package:wizard_app/states/newPolicy/3_newPolicyCovers.dart';
import 'package:wizard_app/states/newPolicy/4_newPolicyYou.dart';
import 'package:wizard_app/states/newPolicy/5_newPolicySubject.dart';

void main() => runApp(MainApp());

class WizardApp extends StatelessWidget {
  WizardApp();

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
      title: 'Wizard Demo',
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

class MainApp extends StatelessWidget {
  MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wizard App',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlueAccent
        ),
        home: MainPage(title: "Wizard App"));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  MainPageState() {
    commonData.initialize().then((data) {
      navigateTo(WizardApp());
    }).catchError((error) {
      updateLabel(error.toString());
    });
  }

  String label = "Initializing...";

  void updateLabel(String text) {
    setState(() {
      label = text + "\n\nPlease ensure local API server is running at localhost:3000";
    });
  }

  void navigateTo(Widget target) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => target));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
            child: Column(
                children: [
                  Helper.bigPaddingNoBottom(Text(label)),
                ]
            )
        )
    );
  }
}
