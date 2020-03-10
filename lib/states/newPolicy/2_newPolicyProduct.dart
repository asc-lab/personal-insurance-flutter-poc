import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/services/wizardData.dart';
import 'package:wizard_app/dto/product.dart';
import 'package:wizard_app/services/helper.dart';

class _NewPolicyProductState extends State<NewPolicyProduct> {
  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    return Scaffold(appBar: Helper.wizardAppBar(widget.title), backgroundColor: Theme.of(context).backgroundColor, body: Step2Builder.getStep());
  }
}

class Step2Builder {
  static Widget getStep() {
    List<Widget> pt = [];
    wizardData.products.forEach((pc) => pt.add(Step2Builder._prod(pc)));

    return Scaffold(
        body: Column(children: <Widget>[
      Flexible(child: ListView(children: pt)),
    ]));
  }

  static Widget _prod(ProductDto prod) {
    return Helper.bigPadding(FlatButton(
      textTheme: ButtonTextTheme.normal,
      child: Row(children: [
        Expanded(
            child: Helper.bigPadding(Column(children: [
          Text(
            prod.name,
            style: Theme.of(commonData.context).textTheme.headline,
            textAlign: TextAlign.center,
          )
        ])))
      ]),
      onPressed: () {
        nextStep(prod);
      },
      color: Theme.of(commonData.context).buttonTheme.colorScheme.secondary,
    ));
  }

  static void nextStep(ProductDto prod) {
    processData.applyProduct(prod);
    Navigator.pushNamed(commonData.context, '/newPolicyCovers');
  }
}

class NewPolicyProduct extends StatefulWidget {
  NewPolicyProduct({Key key}) : super(key: key);
  final String title = 'What kind of pet?';

  @override
  _NewPolicyProductState createState() => _NewPolicyProductState();
}
