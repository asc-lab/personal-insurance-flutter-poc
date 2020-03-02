import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/services/wizardData.dart';
import 'package:wizard_app/dto/dictionary.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:wizard_app/services/helper.dart';

class _NewPolicyTypeState extends State<NewPolicyType> {
  _NewPolicyTypeState() {
    processData.initialize();
  }

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    return Scaffold(
      appBar: Helper.wizardAppBar(widget.title),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder<WizardData>(
          future: wizardData.initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Step1Builder.getStep();
            } else {
              if (snapshot.hasError) {
                return Center(
                    child: Text('ERROR!!!',
                        style: TextStyle(color: Theme.of(context).errorColor)));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }
}

class Step1Builder {
  static Widget getStep() {
    List<Widget> pt = [];
    commonData.dicts[DictCode.PRODUCT_TYPE]
        .forEach((pc) => pt.add(_prodType(pc)));

    return Scaffold(
        body: Column(children: <Widget>[
      Flexible(child: ListView(children: pt)),
    ]));
  }

  static Widget _prodType(DictEntryDto type) {
    return Helper.bigPaddingNoBottom(FlatButton(
      textTheme: ButtonTextTheme.normal,
      child: Row(children: [
        Column(children: [
          Helper.bigPadding(Icon(
            Helper.productTypeIcon(type.code),
            size: 70,
          ))
        ]),
        Expanded(
            child: Helper.bigPadding(Column(children: [
          Text(
            commonData.maps[DictCode.PRODUCT_TYPE][type.code],
            style: Theme.of(commonData.context).textTheme.headline,
            textAlign: TextAlign.center,
          )
        ])))
      ]),
      onPressed: () {
        nextStep(type);
      },
      color: Theme.of(commonData.context).buttonTheme.colorScheme.secondary,
    ));
  }

  static void nextStep(DictEntryDto type) {
    processData.type = type;
    Navigator.pushNamed(commonData.context, '/newPolicyProduct');
  }
}

class NewPolicyType extends StatefulWidget {
  NewPolicyType({Key key}) : super(key: key);
  final String title = 'What do you want to insure?';

  @override
  _NewPolicyTypeState createState() => _NewPolicyTypeState();
}
