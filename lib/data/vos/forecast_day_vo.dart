import 'package:json_annotation/json_annotation.dart';
import 'package:weatherforecast/data/vos/day_forecast_vo.dart';
import 'package:weatherforecast/data/vos/weather_forecast_vo.dart';

import '../../helper/utils.dart';

part 'forecast_day_vo.g.dart';

@JsonSerializable()
class ForecastDayVO{

  @JsonKey(name:"date")
  String? date;

  @JsonKey(name:"date_epoch")
  int? dateEpoch;

  @JsonKey(name:"day")
  DayForecastVO? dayForecastVO;

  @JsonKey(name:'hour')
  List<WeatherForecastVO>? hourForecastList;

  ForecastDayVO(this.date, this.dayForecastVO, this.hourForecastList,this.dateEpoch);

  factory ForecastDayVO.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayVOFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayVOToJson(this);

  String getDate(){
    return getDateInDay(this.dateEpoch!);
  }
}