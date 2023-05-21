// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionVO _$ConditionVOFromJson(Map<String, dynamic> json) => ConditionVO(
      json['text'] as String?,
      json['icon'] as String?,
      json['code'] as int?,
    );

Map<String, dynamic> _$ConditionVOToJson(ConditionVO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
