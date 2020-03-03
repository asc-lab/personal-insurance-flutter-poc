import 'package:json_annotation/json_annotation.dart';

part 'dictionary.g.dart';

@JsonSerializable()
class DictEntryDto {
  DictEntryDto(this.code, this.name);

  final String code;
  final String name;

  factory DictEntryDto.fromJson(Map<String, dynamic> json) => _$DictEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DictEntryDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DictEntryDto && runtimeType == other.runtimeType && code == other.code && name == other.name;

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}
