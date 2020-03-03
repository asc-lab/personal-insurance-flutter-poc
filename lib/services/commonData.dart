import 'package:wizard_app/dto/dictionary.dart';
import 'package:wizard_app/services/dictionaries.dart';
import 'package:flutter/material.dart';

class CommonData {
  static final CommonData _data = new CommonData._internal();

  Map<String, List<DictEntryDto>> dicts;
  Map<String, Map<String, String>> maps;
  BuildContext context;

  Future<CommonData> initialize() async {
    var srv = await DictionariesService().get();

    this.dicts = srv.dictionaries;
    this.maps = srv.maps;

    return this;
  }

  factory CommonData() {
    return _data;
  }

  CommonData._internal();
}

final commonData = CommonData();
