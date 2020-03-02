import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wizard_app/services/processData.dart';
import 'package:wizard_app/dto/dictionary.dart';

class Helper {
  static String apiURL = "http://10.0.2.2:3000/personalInsuranceFlutter/";

  static Widget wizardAppBar(String title) {
    var titleElements = List<Widget>();
    if (processData.type != null) {
      titleElements.add(
          Helper.padding(Icon(Helper.productTypeIcon(processData.type.code))));
    }
    titleElements.add(Flexible(child: Text(title, softWrap: true)));
    return AppBar(
        title: Row(children: titleElements),
        titleSpacing: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: processData.cancelProcess,
          )
        ]);
  }

  static List<DropdownMenuItem<String>> toDropdownItems(
      List<DictEntryDto> dict) {
    List<DropdownMenuItem<String>> entries = List<DropdownMenuItem<String>>();

    DropdownMenuItem<String> empty =
        toDropdownItem(DictEntryDto("", "- none -"));
    entries.add(empty);
    dict.forEach((entry) => entries.add(toDropdownItem(entry)));

    return entries;
  }

  static DropdownMenuItem<String> toDropdownItem(DictEntryDto entry) {
    return DropdownMenuItem<String>(
      value: entry.code,
      child: Text(
        entry.name,
        textAlign: TextAlign.end,
      ),
    );
  }

  static String toDateString(DateTime date) {
    if (date != null) {
      return DateFormat('dd-MM-yyyy').format(date);
    }

    return '';
  }

  static Padding padding(Widget content) {
    return Padding(child: content, padding: EdgeInsets.all(5));
  }

  static Padding bigPadding(Widget content) {
    return Padding(child: content, padding: EdgeInsets.all(15));
  }

  static Padding paddingNoBottom(Widget content) {
    return Padding(child: content, padding: EdgeInsets.fromLTRB(5, 5, 5, 0));
  }

  static Padding bigPaddingNoBottom(Widget content) {
    return Padding(child: content, padding: EdgeInsets.fromLTRB(15, 15, 15, 0));
  }

  static Align left(Widget content) {
    return Align(alignment: Alignment.centerLeft, child: content);
  }

  static IconData productTypeIcon(String productType) {
    switch (productType) {
      case 'TRAVEL':
        return Icons.airplanemode_active;
        break;
      case 'PET':
        return Icons.android;
        break;
      case 'LIFE':
        return Icons.person;
        break;
      case 'MEDI':
        return Icons.healing;
        break;
      default:
        return Icons.error;
    }
  }
}
