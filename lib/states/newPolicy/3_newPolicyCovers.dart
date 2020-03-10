import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/services/data.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:wizard_app/services/helper.dart';

class _NewPolicyCoversState extends State<NewPolicyCovers> {
  Map<String, bool> _checked;
  double _premium = 0.00;
  int _calculating = 0;

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    _checked = Map<String, bool>();
    commonData.dicts[DictCode.COVER].forEach((cover) {
      _checked[cover.code] = processData.covers.contains(cover);
    });
    List<Widget> pt = [];
    commonData.dicts[DictCode.COVER].forEach((cov) => pt.add(Helper.padding(Container(
        color: _checked[cov.code] ? Theme.of(context).accentColor : Theme.of(context).canvasColor,
        child: CheckboxListTile(
            title: Text(cov.name, style: TextStyle(fontWeight: FontWeight.bold)),
            value: _checked[cov.code],
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  processData.covers.add(cov);
                } else {
                  processData.covers.remove(cov);
                }
                _calculating++;
                DataService.calculatePremium()
                    .then((result) => setState(() {
                          _premium = result.premium;
                          _calculating--;
                        }))
                    .catchError((err) => _calculating--);
              });
            })))));

    return Scaffold(
      appBar: Helper.wizardAppBar(widget.title),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Scaffold(
          body: Column(children: <Widget>[
        Flexible(child: ListView(children: pt)),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Builder(
          builder: (ctx) => FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  Step3Builder.nextStep(Scaffold.of(ctx));
                },
              )),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).accentColor,
        notchMargin: 10,
        child: Container(
            child: Helper.bigPadding(Text('Premium: ' + ((_calculating > 0) ? 'calculating...' : (_premium > 0 ? _premium.toString() + ' PLN' : '-')),
                style: Theme.of(context).textTheme.headline))),
      ),
    );
  }
}

class Step3Builder {
  static void nextStep(ScaffoldState ss) {
    if (processData.covers.length < 3) {
      ss.showSnackBar(SnackBar(
        action: SnackBarAction(
          label: 'Will do',
          onPressed: () {
            ss.removeCurrentSnackBar();
          },
        ),
        content: Text(
          'You need to pick at least 3 covers',
          style: TextStyle(color: Theme.of(commonData.context).errorColor, fontWeight: FontWeight.bold),
        ),
      ));
      return;
    }

    Navigator.pushNamed(commonData.context, '/newPolicyYou');
  }
}

class NewPolicyCovers extends StatefulWidget {
  NewPolicyCovers({Key key}) : super(key: key);
  final String title = 'What should we cover?';

  @override
  _NewPolicyCoversState createState() => _NewPolicyCoversState();
}
