import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weatherforecast/constant/api_constant.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: aBaseUrl)
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET(aGetCityEndPointt)
  Future<String> getCities(@Path('name') String name);

  @GET(aGetThreeDayWeatherEndPoint)
  Future<String> getThreeDayWeatherForecast(
      @Path('name') String name, @Path('day') String day);
}
