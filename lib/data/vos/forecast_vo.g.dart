// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastVO _$ForecastVOFromJson(Map<String, dynamic> json) => ForecastVO(
      (json['forecastday'] as List<dynamic>?)
          ?.map((e) => ForecastDayVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastVOToJson(ForecastVO instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDayList,
    };
