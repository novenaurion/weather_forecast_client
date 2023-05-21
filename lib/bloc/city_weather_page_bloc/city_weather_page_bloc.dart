import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_event.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_state.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';

import '../../data/model/impl/weather_model_impl.dart';
import '../../data/model/weather_model.dart';
import '../../persistance/app_database.dart';
import '../../persistance/city_dao.dart';

class CityWeatherPageBloc
    extends Bloc<CityWeatherPageEvent, CityWeatherPageState> {
  static final CityWeatherPageBloc _singleton = CityWeatherPageBloc._internal();
  CityDao? cityDao;

  factory CityWeatherPageBloc() {
    return _singleton;
  }

  CityWeatherPageBloc._internal() : super(const CityWeatherPageInitial()) {
    print("hello it's start");
    on<GetCityWeatherEvent>(_onGetCityWeather);
  }

  WeatherModel weatherModel = WeatherModelImpl();

  Future<void> _onGetCityWeather(
      GetCityWeatherEvent event, Emitter<CityWeatherPageState> emit) async {
    print("hello name==>${event.name}");
    emit(CityWeatherPageLoadingState());
    try {
      ForecastResponse forecastResponse =
          await weatherModel.getCityWeatherForecast(event.name ?? "", "4");
      emit(CityWeatherPageLoadedState(forecastResponse));
    } catch (error) {
      print("error=>$error");
      emit(CityWeatherPageErrorState(error.toString()));
    }
  }

  Future getCityWeather(String name) async {
    ForecastResponse forecastResponse =
        await weatherModel.getCityWeatherForecast(name, "4");
    return forecastResponse;
  }
}
