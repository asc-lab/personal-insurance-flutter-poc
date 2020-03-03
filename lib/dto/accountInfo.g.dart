// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoDto _$AccountInfoDtoFromJson(Map<String, dynamic> json) {
  return AccountInfoDto(json['owner'] == null ? null : PersonDto.fromJson(json['owner'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AccountInfoDtoToJson(AccountInfoDto instance) => <String, dynamic>{'owner': instance.owner};
