import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto(this.name, this.surname, this.sex, this.email, this.shoe);
  
  PersonDto.defaults() {
    this.name = "";
    this.surname = "";
  }

  String name;
  String surname;
  String sex;
  String email;
  String shoe;

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);
}
