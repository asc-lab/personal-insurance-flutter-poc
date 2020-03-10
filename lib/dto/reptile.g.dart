// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reptile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReptileDto _$ReptileDtoFromJson(Map<String, dynamic> json) {
  return ReptileDto(json['name'], json['nickname'], json['dateOfBirth'] == null ? null : DateTime.parse(json['dateOfBirth'] as String),
      json['species'] as String, json['hasTail'] as bool, json['numberOfLegs'] as int);
}

Map<String, dynamic> _$ReptileDtoToJson(ReptileDto instance) => <String, dynamic>{
      'name': instance.name,
      'nickname': instance.nickname,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'species': instance.species,
      'hasTail': instance.hasTail,
      'numberOfLegs': instance.numberOfLegs
    };
