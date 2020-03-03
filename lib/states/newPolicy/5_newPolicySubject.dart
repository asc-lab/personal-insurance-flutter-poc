import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/services/helper.dart';
import 'package:wizard_app/states/newPolicy/policyObject/reptileObject.dart';

class _NewPolicySubjectState extends State<NewPolicySubject> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    return Scaffold(
      appBar: Helper.wizardAppBar(widget.title),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(children: <Widget>[
        Flexible(child: Form(key: _formKey, child: ReptileObject(reptile: processData.pet, parentFormKey: this._formKey))),
      ]),
      floatingActionButton: Builder(
          builder: (ctx) => FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  Step5Builder.nextStep(_formKey, Scaffold.of(ctx));
                },
              )),
    );
  }
}

class Step5Builder {
  static void nextStep(GlobalKey<FormState> fk, ScaffoldState ss) {
    if (fk.currentState.validate()) {
      fk.currentState.save();
      Navigator.pushNamedAndRemoveUntil(commonData.context, '/', (Route<dynamic> route) => false);
    }
  }
}

class NewPolicySubject extends StatefulWidget {
  NewPolicySubject({Key key}) : super(key: key);
  final String title = 'Your pet';

  @override
  _NewPolicySubjectState createState() => _NewPolicySubjectState();
}
