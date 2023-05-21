import 'package:dio/dio.dart';
import 'package:weatherforecast/network/weather_api.dart';
import '../../constant/api_constant.dart';

abstract class BaseModel {
  late WeatherApi mTheApi;
  BaseModel() {
    final dio = Dio(
      BaseOptions(
          followRedirects: false,
          baseUrl: aBaseUrl,
          validateStatus: (status) {
            return status! < 300;
          },
          headers:
          {
            "Accept":"application/json"
          }
      ),
    );
    mTheApi = WeatherApi(dio);
  }
}
