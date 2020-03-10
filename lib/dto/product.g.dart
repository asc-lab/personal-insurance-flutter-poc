// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return ProductDto(json['code'] as String, (json['coverList'] as List)?.map((e) => e as String), json['name'] as String, (json['rate'] as num)?.toDouble(),
      json['special'] as bool, json['type'] as String);
}

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'rate': instance.rate,
      'coverList': instance.coverList?.toList(),
      'special': instance.special,
      'type': instance.type
    };
