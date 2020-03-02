import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/dto/policy.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:wizard_app/services/helper.dart';

class _HomepageTileState extends State<HomepageTile> {
  final PolicyDto _policy;
  bool _expanded;
  BuildContext _context;
  DateTime _now = DateTime(2019, 12, 1);

  _HomepageTileState(this._policy) {
    this._expanded = false;
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    ThemeData theme = Theme.of(_context);

    return GestureDetector(
        onTap: () {
          setState(() {
            this._expanded = !this._expanded;
          });
        },
        child: Helper.bigPaddingNoBottom(Card(
            color: _isPolicyExpired()
                ? theme.chipTheme.disabledColor
                : theme.cardTheme.color,
            borderOnForeground: true,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Icon(
                      Helper.productTypeIcon(_policy.type),
                      color: theme.textTheme.body1.color,
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: AnimatedCrossFade(
                            duration: Duration(milliseconds: 300),
                            firstChild: _buildMiniTile(),
                            secondChild: _buildMaxiTile(),
                            crossFadeState: !_expanded
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            alignment: Alignment.topLeft,
                          ))),
                  Padding(
                    child: Icon(
                      _expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: theme.textTheme.body1.color,
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ]))));
  }

  Widget _buildMiniTile() {
    return Column(children: <Widget>[
      Helper.padding(Text(
        commonData.maps[DictCode.PRODUCT_TYPE][_policy.type],
        style: Theme.of(_context).textTheme.headline,
        textAlign: TextAlign.left,
      )),
      Row(
        children: <Widget>[
          Padding(child: Text(_policy.number), padding: EdgeInsets.all(5)),
          Helper.padding(Text(Helper.toDateString(_policy.validFrom),
              style: TextStyle(fontWeight: _getFontWeight(_policy.validFrom)))),
          Helper.padding(Text(
            Helper.toDateString(_policy.validTo),
            style: TextStyle(
                color: _getColor(),
                fontWeight: _getFontWeight(_policy.validTo)),
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ]);
  }

  bool _isPolicyNearExpiry() {
    Duration diff = this._policy.validTo.difference(_now);
    return diff.inDays < 7 && diff.inDays > -1;
  }

  bool _isPolicyExpired() {
    Duration diff = this._policy.validTo.difference(_now);
    return diff.inDays < 0;
  }

  bool _isDateNearNow(DateTime date) {
    int diffDays = date.difference(_now).inDays;
    return diffDays < 60 && diffDays > -60;
  }

  Color _getColor({Color alternateDefaultColor}) {
    if (_isPolicyNearExpiry()) {
      return Theme.of(_context).errorColor;
    }
    return Theme.of(_context).textTheme.body1.color;
  }

  FontWeight _getFontWeight(DateTime date) {
    if (_isDateNearNow(date)) {
      return FontWeight.bold;
    }
    return FontWeight.normal;
  }

  Widget _buildMaxiTile() {
    var children = List<Widget>();

    children.add(Helper.padding(Text(
      commonData.maps[DictCode.PRODUCT_TYPE][_policy.type],
      style: Theme.of(_context).textTheme.headline,
      textAlign: TextAlign.left,
    )));

    children.add(Helper.left(Helper.padding(Text(
      'Covers:',
      style: TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ))));

    _policy.covers.forEach((coverCode) => children.add(Helper.left(
        Helper.padding(Text(commonData.maps[DictCode.COVER][coverCode])))));

    if (_isPolicyNearExpiry() && !_isPolicyExpired()) {
      children.add(Helper.padding(Row(
        children: <Widget>[
          Helper.padding(Icon(
            Icons.warning,
            color: Theme.of(_context).errorColor,
          )),
          Expanded(
              child: Text(
            'Nearing end of cover (' +
                Helper.toDateString(_policy.validTo) +
                ')',
            style: TextStyle(color: Theme.of(_context).errorColor),
            textAlign: TextAlign.center,
          )),
          FlatButton(
            textTheme: ButtonTextTheme.normal,
            child: Text('RENEW', style: Theme.of(_context).textTheme.button),
            onPressed: () {},
            color: Theme.of(_context).buttonTheme.colorScheme.secondary,
          )
        ],
      )));
    }

    return Column(children: children);
  }
}

class HomepageTile extends StatefulWidget {
  HomepageTile({Key key, this.policy}) : super(key: key);
  final PolicyDto policy;
  @override
  _HomepageTileState createState() {
    return _HomepageTileState(this.policy);
  }
}
