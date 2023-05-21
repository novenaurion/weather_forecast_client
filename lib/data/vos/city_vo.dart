
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_vo.g.dart';

@JsonSerializable()
@entity
class CityVO{

  @JsonKey(name:"id")
  @primaryKey
  int? cityId;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"region")
  String? region;

  @JsonKey(name:'country')
  String? country;

  @JsonKey(name:"lat")
  double? lat;

  @JsonKey(name:"lon")
  double? lon;

  @JsonKey(name:"url")
  String? url;

  CityVO(this.cityId, this.name, this.region, this.country, this.lat, this.lon,
      this.url);

  factory CityVO.fromJson(Map<String, dynamic> json) =>
      _$CityVOFromJson(json);
  Map<String, dynamic> toJson() => _$CityVOToJson(this);
}

