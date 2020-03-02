import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wizard_app/dto/dictionary.dart';
import 'package:wizard_app/services/helper.dart';

class DictionariesService {
  Map<String, List<DictEntryDto>> dictionaries;
  Map<String, Map<String, String>> maps;

  Future<DictionariesService> get() async {
    final response = await http.get(Helper.apiURL + 'getDicts');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      Map<String, dynamic> content = json.decode(response.body);
      this.dictionaries = content.map((k, v) => MapEntry(
          k,
          v
              .map<DictEntryDto>(
                  (entry) => DictEntryDto.fromJson(entry))
              .toList()));
      this._setMapsForDicts();

      return this;
    } else {
      throw Exception('Failed to load dictionaries');
    }
  }

  void _setMapsForDicts() {
    this.maps = this.dictionaries.map((k, v) => MapEntry(
        k, Map.fromIterable(v, key: (e) => e.code, value: (e) => e.name)));
  }
}

class DictCode {
  static final COVER = 'COVER';
  static final PRODUCT_TYPE = 'PRODUCT_TYPE';
  static final SEX = 'SEX';
  static final REPTILE_SPECIES = 'REPTILE_SPECIES';
}
