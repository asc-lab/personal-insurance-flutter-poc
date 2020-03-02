import 'package:wizard_app/dto/product.dart';
import 'package:wizard_app/services/data.dart';

class WizardData {
  static final WizardData _data = new WizardData._internal();

  List<ProductDto> products;

  Future<WizardData> initialize() async {
    var prod = await DataService.getProducts();

    this.products = prod;

    return this;
  }

  factory WizardData() {
    return _data;
  }

  WizardData._internal();
}

final wizardData = WizardData();
