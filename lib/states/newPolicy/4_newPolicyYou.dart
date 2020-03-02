import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:wizard_app/services/helper.dart';
import 'package:validate/validate.dart';
import 'package:wizard_app/services/validations.dart';

class _NewPolicyYouState extends State<NewPolicyYou> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    return Scaffold(
      appBar: Helper.wizardAppBar(widget.title),
      backgroundColor: Theme.of(context).canvasColor,
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Helper.padding(TextFormField(
                initialValue: processData.owner.name,
                onSaved: (val) => setState(() {
                  processData.owner.name = val;
                }),
                decoration: InputDecoration(labelText: 'First name*'),
                validator: Validations.required,
              )),
              Helper.padding(TextFormField(
                initialValue: processData.owner.surname,
                onSaved: (val) => setState(() {
                  processData.owner.surname = val;
                }),
                decoration: InputDecoration(labelText: 'Last name*'),
                validator: Validations.required,
              )),
              Helper.padding(TextFormField(
                initialValue: processData.owner.email,
                onSaved: (val) => setState(() {
                  processData.owner.email = val;
                }),
                decoration: InputDecoration(labelText: 'E-mail address*'),
                validator: (value) {
                  var isEmpty = Validations.required(value);
                  if (isEmpty != null) {
                    return isEmpty;
                  }

                  try {
                    Validate.isEmail(value);
                  } catch (e) {
                    return 'Value must be a valid e-mail address';
                  }

                  return null;
                },
              )),
              Helper.padding(TextFormField(
                  initialValue: processData.owner.shoe,
                  onSaved: (val) => setState(() {
                        processData.owner.shoe = val;
                      }),
                  decoration: InputDecoration(labelText: 'Shoe size'))),
              Helper.padding(DropdownButtonFormField<String>(
                  value: processData.owner.sex,
                  onSaved: (val) => setState(() {
                        processData.owner.sex = val;
                      }),
                  decoration: InputDecoration(labelText: 'Sex*'),
                  items:
                      Helper.toDropdownItems(commonData.dicts[DictCode.SEX]))),
              Helper.padding(FlatButton(
                textTheme: ButtonTextTheme.normal,
                child: Text('Use my profile data',
                    style: Theme.of(context).textTheme.button),
                onPressed: () => setState(() {
                  processData.setOwnerFromAccount();
                  this._formKey.currentState.reset();
                }),
                color: Theme.of(context).buttonTheme.colorScheme.background,
              ))
            ],
          ))),
      floatingActionButton: Builder(
          builder: (ctx) => FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  Step4Builder.nextStep(_formKey, Scaffold.of(ctx));
                },
              )),
    );
  }
}

class Step4Builder {
  static void nextStep(GlobalKey<FormState> fk, ScaffoldState ss) {
    if (fk.currentState.validate()) {
      fk.currentState.save();
      Navigator.pushNamed(commonData.context, '/newPolicySubject');
    }
  }
}

class NewPolicyYou extends StatefulWidget {
  NewPolicyYou({Key key}) : super(key: key);
  final String title = 'The policy holder';

  @override
  _NewPolicyYouState createState() => _NewPolicyYouState();
}
