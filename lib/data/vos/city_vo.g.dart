// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityVO _$CityVOFromJson(Map<String, dynamic> json) => CityVO(
      json['id'] as int?,
      json['name'] as String?,
      json['region'] as String?,
      json['country'] as String?,
      (json['lat'] as num?)?.toDouble(),
      (json['lon'] as num?)?.toDouble(),
      json['url'] as String?,
    );

Map<String, dynamic> _$CityVOToJson(CityVO instance) => <String, dynamic>{
      'id': instance.cityId,
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'url': instance.url,
    };
