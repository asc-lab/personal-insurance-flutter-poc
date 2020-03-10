import 'package:flutter/material.dart';
import 'package:wizard_app/services/commonData.dart';
import 'package:wizard_app/dto/accountInfo.dart';
import 'package:wizard_app/dto/dictionary.dart';
import 'package:wizard_app/dto/person.dart';
import 'package:wizard_app/dto/pet.dart';
import 'package:wizard_app/dto/product.dart';
import 'package:wizard_app/dto/reptile.dart';

class ProcessData {
  static final ProcessData _data = new ProcessData._internal();
  AccountInfoDto account;

  DictEntryDto type;
  ProductDto product;
  List<DictEntryDto> covers;
  PersonDto owner;
  PetDto pet;

  void initialize() {
    this.type = null;
    this.product = null;
    this.covers = [];
    this.owner = PersonDto.defaults();
    this.pet = null;
  }

  void cancelProcess() {
    this.initialize();
    Navigator.pushNamedAndRemoveUntil(commonData.context, '/', (Route<dynamic> route) => false);
  }

  void applyProduct(ProductDto product) {
    this.product = product;

    this.pet = ReptileDto.defaults();
  }

  void setOwnerFromAccount() {
    this.owner = PersonDto.fromJson(account.owner.toJson());
  }

  factory ProcessData() {
    return _data;
  }

  ProcessData._internal();
}

final processData = ProcessData();
