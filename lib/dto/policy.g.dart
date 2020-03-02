// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyDto _$PolicyDtoFromJson(Map<String, dynamic> json) {
  return PolicyDto(
      json['number'] as String,
      (json['rate'] as num)?.toDouble(),
      json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      json['validTo'] == null
          ? null
          : DateTime.parse(json['validTo'] as String),
      (json['covers'] as List)?.map((e) => e as String),
      json['type'] as String);
}

Map<String, dynamic> _$PolicyDtoToJson(PolicyDto instance) => <String, dynamic>{
      'number': instance.number,
      'rate': instance.rate,
      'validFrom': instance.validFrom?.toIso8601String(),
      'validTo': instance.validTo?.toIso8601String(),
      'covers': instance.covers?.toList(),
      'type': instance.type
    };
