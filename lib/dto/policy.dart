import 'package:json_annotation/json_annotation.dart';

part 'policy.g.dart';

@JsonSerializable()
class PolicyDto {
  PolicyDto(this.number, this.rate, this.validFrom, this.validTo, this.covers, this.type);

  final String number;
  final double rate;
  final DateTime validFrom;
  final DateTime validTo;
  final Iterable<String> covers;
  final String type;

  factory PolicyDto.fromJson(Map<String, dynamic> json) =>
      _$PolicyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyDtoToJson(this);
}
