import 'package:json_annotation/json_annotation.dart';
import 'package:weatherforecast/data/vos/condition_vo.dart';

part 'day_forecast_vo.g.dart';

@JsonSerializable()
class DayForecastVO{

  @JsonKey(name:"maxtemp_c")
  double? maxTempC;

  @JsonKey(name:"maxtemp_f")
  double? maxTempF;

  @JsonKey(name:"mintemp_c")
  double? minTempC;

  @JsonKey(name:"mintemp_f")
  double? minTempF;

  @JsonKey(name:"condition")
  ConditionVO? conditionVO;

  DayForecastVO(this.maxTempC, this.maxTempF, this.minTempC, this.minTempF,
      this.conditionVO);

  factory DayForecastVO.fromJson(Map<String, dynamic> json) =>
      _$DayForecastVOFromJson(json);
  Map<String, dynamic> toJson() => _$DayForecastVOToJson(this);
}
