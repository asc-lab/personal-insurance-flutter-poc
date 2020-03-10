import 'package:json_annotation/json_annotation.dart';

//flutter packages pub run build_runner watch
part 'product.g.dart';

@JsonSerializable()
class ProductDto {
  ProductDto(this.code, this.coverList, this.name, this.rate, this.special, this.type);

  final String code;
  final String name;
  final double rate;
  final Iterable<String> coverList;
  final bool special;
  final String type;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
