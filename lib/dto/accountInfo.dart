import 'package:json_annotation/json_annotation.dart';
import 'package:wizard_app/dto/person.dart';

//flutter packages pub run build_runner watch
part 'accountInfo.g.dart';

@JsonSerializable()
class AccountInfoDto {
  AccountInfoDto(this.owner);

  final PersonDto owner;

  factory AccountInfoDto.fromJson(Map<String, dynamic> json) => _$AccountInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoDtoToJson(this);
}
