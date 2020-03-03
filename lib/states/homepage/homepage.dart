import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/dto/policy.dart';
import 'package:wizard_app/services/helper.dart';
import 'package:wizard_app/states/homepage/homepageTile.dart';

class MyHomePage extends StatelessWidget {
  final Future<List<PolicyDto>> _policies;

  MyHomePage(this._policies);

  void _newPolicy() {
    Navigator.pushNamed(commonData.context, '/newPolicyType');
  }

  @override
  Widget build(BuildContext context) {
    commonData.context = context;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your policies'),
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder<List<PolicyDto>>(
          future: this._policies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data.length, itemBuilder: (BuildContext ctxt, int index) => HomepageTile(policy: snapshot.data[index]));
            } else {
              return Center(child: Column(children: [Helper.bigPaddingNoBottom(Text('Loading...')), Helper.bigPaddingNoBottom(CircularProgressIndicator())]));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _newPolicy,
        tooltip: 'Register new policy',
        child: Icon(Icons.add_shopping_cart),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
    );
  }
}
