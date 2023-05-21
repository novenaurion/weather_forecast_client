// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_forecast_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayForecastVO _$DayForecastVOFromJson(Map<String, dynamic> json) =>
    DayForecastVO(
      (json['maxtemp_c'] as num?)?.toDouble(),
      (json['maxtemp_f'] as num?)?.toDouble(),
      (json['mintemp_c'] as num?)?.toDouble(),
      (json['mintemp_f'] as num?)?.toDouble(),
      json['condition'] == null
          ? null
          : ConditionVO.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayForecastVOToJson(DayForecastVO instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'condition': instance.conditionVO,
    };
