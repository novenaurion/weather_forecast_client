// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastVO _$WeatherForecastVOFromJson(Map<String, dynamic> json) =>
    WeatherForecastVO(
      json['last_updated'] as String?,
      json['time'] as String?,
      (json['temp_c'] as num?)?.toDouble(),
      (json['temp_f'] as num?)?.toDouble(),
      json['is_day'] as int?,
      json['cloud'] as int?,
      (json['feelslike_c'] as num?)?.toDouble(),
      (json['feelslike_f'] as num?)?.toDouble(),
      json['condition'] == null
          ? null
          : ConditionVO.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastVOToJson(WeatherForecastVO instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdated,
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelLikeC,
      'feelslike_f': instance.feelsLikeF,
      'condition': instance.conditionVO,
    };
