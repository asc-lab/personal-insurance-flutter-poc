import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/dto/reptile.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:wizard_app/services/helper.dart';
import 'package:wizard_app/services/validations.dart';

class _ReptileObjectState extends State<ReptileObject> {
  final ReptileDto _reptile;
  final GlobalKey<FormState> _parentFormKey;

  _ReptileObjectState(this._reptile, this._parentFormKey);

  @override
  Widget build(BuildContext context) {
    var dobCtrl = new TextEditingController(text: Helper.toDateString(this._reptile.dateOfBirth));

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Helper.padding(TextFormField(
          initialValue: _reptile.name,
          onChanged: (val) {
            _reptile.name = val;
          },
          decoration: InputDecoration(labelText: 'Name*'),
          validator: Validations.required,
        )),
        Helper.padding(TextFormField(
            initialValue: _reptile.nickname,
            onChanged: (val) {
              _reptile.nickname = val;
            },
            decoration: InputDecoration(labelText: 'Alias'))),
        Helper.padding(
          TextFormField(
              controller: dobCtrl,
              onTap: () => _setBirthDate(context).then((d) {
                    dobCtrl.text =
                        Helper.toDateString(this._reptile.dateOfBirth);
                  }),
              decoration: InputDecoration(labelText: 'Birth / hatch date'),
              onSaved: (String val) {}),
        ),
        Helper.padding(DropdownButtonFormField<String>(
            value: _reptile.species,
            onChanged: (val) {
              setState(() {
                _reptile.species = val;
              });
            },
            decoration: InputDecoration(labelText: 'Species'),
            items: Helper.toDropdownItems(
                commonData.dicts[DictCode.REPTILE_SPECIES]))),
        Helper.padding(Row(children: [
          Flexible(flex: 1, child: Text('Has a tail: ')),
          Flexible(
              flex: 2,
              child: Checkbox(
                value: _reptile.hasTail,
                onChanged: (value) {
                  setState(() {
                    _reptile.hasTail = value;
                  });
                },
              ))
        ])),
        Helper.padding(TextFormField(
            initialValue: _reptile.numberOfLegs.toString(),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              _reptile.numberOfLegs = int.parse(val);
            },
            decoration: InputDecoration(labelText: 'Leg count:'))),
      ],
    ));
  }

  Future<Null> _setBirthDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: (this._reptile.dateOfBirth ?? DateTime.now()),
        firstDate: DateTime(2000, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != this._reptile.dateOfBirth) {
      setState(() => this._reptile.dateOfBirth = picked);
    }
  }
}

class ReptileObject extends StatefulWidget {
  ReptileObject({Key key, this.reptile, this.parentFormKey}) : super(key: key);
  final ReptileDto reptile;
  final GlobalKey<FormState> parentFormKey;
  @override
  _ReptileObjectState createState() {
    return _ReptileObjectState(this.reptile, this.parentFormKey);
  }
}
