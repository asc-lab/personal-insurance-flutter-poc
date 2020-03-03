import 'package:json_annotation/json_annotation.dart';
import 'package:wizard_app/dto/pet.dart';

//flutter packages pub run build_runner watch
part 'reptile.g.dart';

@JsonSerializable()
class ReptileDto extends PetDto {
  ReptileDto.defaults() : super.defaults() {
    this.species = "";
    this.hasTail = true;
    this.numberOfLegs = 4;
    this.dateOfBirth = DateTime.now();
  }

  ReptileDto(name, nickname, this.dateOfBirth, this.species, this.hasTail, this.numberOfLegs) : super(name, nickname, dateOfBirth);

  DateTime dateOfBirth;
  String species;
  bool hasTail;
  int numberOfLegs;

  factory ReptileDto.fromJson(Map<String, dynamic> json) => _$ReptileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReptileDtoToJson(this);
}
