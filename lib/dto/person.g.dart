// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) {
  return PersonDto(json['name'] as String, json['surname'] as String, json['sex'] as String, json['email'] as String, json['shoe'] as String);
}

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) =>
    <String, dynamic>{'name': instance.name, 'surname': instance.surname, 'sex': instance.sex, 'email': instance.email, 'shoe': instance.shoe};
