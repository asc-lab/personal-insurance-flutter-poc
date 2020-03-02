import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wizard_app/dto/accountInfo.dart';
import 'package:wizard_app/dto/calculationResult.dart';
import 'package:wizard_app/dto/policy.dart';
import 'package:wizard_app/dto/product.dart';
import 'package:wizard_app/services/helper.dart';

class DataService {
  static Future<List<ProductDto>> getProducts() async {
    final response = await http.get(Helper.apiURL + 'getProducts');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> content = json.decode(response.body)['content'];
      return content
          .map((productJson) => ProductDto.fromJson(productJson))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load account info');
    }
  }

  static Future<AccountInfoDto> getAccountInfo() async {
    final response = await http.get(Helper.apiURL + 'getAccountInfo');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      dynamic content = json.decode(response.body)['content'];
      return AccountInfoDto.fromJson(content);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load products');
    }
  }

  static Future<List<PolicyDto>> getPolicies() async {
    final response = await http.get(Helper.apiURL + 'getPolicies');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> content = json.decode(response.body)['content'];
      return content
          .map((policyJson) => PolicyDto.fromJson(policyJson))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load policies');
    }
  }

  static Future<CalculationResultDto> calculatePremium() async {
    final response = await http.get(Helper.apiURL + 'calculatePremium');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      dynamic content = json.decode(response.body)['content'];
      return CalculationResultDto.fromJson(content);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to calculate premium');
    }
  }
}
