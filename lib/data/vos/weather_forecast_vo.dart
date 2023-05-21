import 'package:json_annotation/json_annotation.dart';
import 'package:weatherforecast/data/vos/condition_vo.dart';
import 'package:weatherforecast/helper/extension.dart';

part 'weather_forecast_vo.g.dart';

@JsonSerializable()
class WeatherForecastVO {
  @JsonKey(name: "last_updated")
  String? lastUpdated;

  @JsonKey(name:"time")
  String? time;

  @JsonKey(name: "temp_c")
  double? tempC;

  @JsonKey(name: "temp_f")
  double? tempF;

  @JsonKey(name: "is_day")
  int? isDay;

  @JsonKey(name: "cloud")
  int? cloud;

  @JsonKey(name: "feelslike_c")
  double? feelLikeC;

  @JsonKey(name: "feelslike_f")
  double? feelsLikeF;

  @JsonKey(name: "condition")
  ConditionVO? conditionVO;

  WeatherForecastVO(this.lastUpdated,this.time, this.tempC, this.tempF, this.isDay,
      this.cloud, this.feelLikeC, this.feelsLikeF, this.conditionVO);

  factory WeatherForecastVO.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastVOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastVOToJson(this);

  String getHour(){
    String hour=time!.split(" ").last;
    String amPm=hour.changeAmToPm();
    return amPm;
  }
}
