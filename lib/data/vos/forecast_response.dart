
import 'package:json_annotation/json_annotation.dart';
import 'package:weatherforecast/data/vos/weather_forecast_vo.dart';

import 'city_vo.dart';
import 'forecast_vo.dart';

part 'forecast_response.g.dart';

@JsonSerializable()
class ForecastResponse{

  @JsonKey(name:"location")
  CityVO? cityVO;

  @JsonKey(name:"current")
  WeatherForecastVO? currentForecast;

  @JsonKey(name:"forecast")
  ForecastVO? forecastVO;

  ForecastResponse(this.cityVO, this.currentForecast, this.forecastVO);

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}