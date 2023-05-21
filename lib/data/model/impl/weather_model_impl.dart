import 'dart:convert';

import 'package:weatherforecast/data/model/base_model.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';
import 'package:weatherforecast/helper/api_handle_error.dart';

import '../weather_model.dart';

class WeatherModelImpl extends BaseModel implements WeatherModel {
  static final WeatherModelImpl _singleton = WeatherModelImpl._internal();

  factory WeatherModelImpl() {
    return _singleton;
  }

  WeatherModelImpl._internal();

  @override
  Future getCities(String name) {
    return mTheApi.getCities(name).then((value) {
      List jsonMap = json.decode(value);
      List<CityVO> cityList = (jsonMap).map((e) => CityVO.fromJson(e)).toList();
      return cityList;
    }, onError: (error) =>handleError(error));
  }

  @override
  Future getCityWeatherForecast(String name,String day) {
    return mTheApi.getThreeDayWeatherForecast(name,day).then((value) {
      Map<String, dynamic> jsonMap = json.decode(value);
      ForecastResponse forecastResponse = ForecastResponse.fromJson(jsonMap);
      return forecastResponse;
    }, onError: (error) =>handleError(error));
  }
}
