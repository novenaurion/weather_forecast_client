// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      json['location'] == null
          ? null
          : CityVO.fromJson(json['location'] as Map<String, dynamic>),
      json['current'] == null
          ? null
          : WeatherForecastVO.fromJson(json['current'] as Map<String, dynamic>),
      json['forecast'] == null
          ? null
          : ForecastVO.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'location': instance.cityVO,
      'current': instance.currentForecast,
      'forecast': instance.forecastVO,
    };
