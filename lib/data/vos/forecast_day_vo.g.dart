// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayVO _$ForecastDayVOFromJson(Map<String, dynamic> json) =>
    ForecastDayVO(
      json['date'] as String?,
      json['day'] == null
          ? null
          : DayForecastVO.fromJson(json['day'] as Map<String, dynamic>),
      (json['hour'] as List<dynamic>?)
          ?.map((e) => WeatherForecastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date_epoch'] as int?,
    );

Map<String, dynamic> _$ForecastDayVOToJson(ForecastDayVO instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_epoch': instance.dateEpoch,
      'day': instance.dayForecastVO,
      'hour': instance.hourForecastList,
    };
