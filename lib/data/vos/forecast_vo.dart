
import 'package:json_annotation/json_annotation.dart';

import 'forecast_day_vo.dart';

part 'forecast_vo.g.dart';

@JsonSerializable()
class ForecastVO{

  @JsonKey(name:"forecastday")
  List<ForecastDayVO>? forecastDayList;

  ForecastVO(this.forecastDayList);

  factory ForecastVO.fromJson(Map<String, dynamic> json) =>
      _$ForecastVOFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastVOToJson(this);
}