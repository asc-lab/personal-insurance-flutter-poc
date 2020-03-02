import 'package:json_annotation/json_annotation.dart';

//flutter packages pub run build_runner watch
part 'calculationResult.g.dart';

@JsonSerializable()
class CalculationResultDto {
  CalculationResultDto(this.premium);

  final double premium;

  factory CalculationResultDto.fromJson(Map<String, dynamic> json) => _$CalculationResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationResultDtoToJson(this);
}


