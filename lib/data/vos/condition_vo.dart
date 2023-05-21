

import 'package:json_annotation/json_annotation.dart';

part 'condition_vo.g.dart';

@JsonSerializable()
class ConditionVO{

  @JsonKey(name:"text")
  String? text;

  @JsonKey(name:"icon")
  String? icon;

  @JsonKey(name:"code")
  int? code;

  ConditionVO(this.text, this.icon, this.code);

  factory ConditionVO.fromJson(Map<String, dynamic> json) =>
      _$ConditionVOFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionVOToJson(this);
}
