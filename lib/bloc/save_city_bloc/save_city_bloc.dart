import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_event.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_state.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';

import '../../data/model/impl/weather_model_impl.dart';
import '../../data/model/weather_model.dart';
import '../../persistance/app_database.dart';
import '../../persistance/city_dao.dart';

class SaveCityBloc extends Bloc<SaveCityEvent, SaveCityState> {
  static final SaveCityBloc _singleton = SaveCityBloc._internal();
  CityDao? cityDao;

  factory SaveCityBloc() {
    return _singleton;
  }

  SaveCityBloc._internal() : super(const SaveCityInitial()) {
    print("hello it's start");
    declareDatabase();
    on<SaveFavouriteCityEvent>(_onSaveCity);
    on<CheckSavedCityEvent>(_checkSavedCity);
    on<GetFvouriteCityEvent>(_getFavCity);
  }

  WeatherModel weatherModel = WeatherModelImpl();

  Future<void> _onSaveCity(
      SaveFavouriteCityEvent event, Emitter<SaveCityState> emit) async {
    print('city==>${event.cityVO!}');

    CityVO? city = await cityDao!.findCityById(event.cityVO!.cityId!);
    if (city == null) {
      await cityDao!.insertCity(event.cityVO!);
      print("hellor==");
      add(CheckSavedCityEvent(event.cityVO!.cityId!));
    } else {
      await cityDao!.deleteCity(event.cityVO!);

      add(CheckSavedCityEvent(event.cityVO!.cityId!));
    }
  }

  Future<void> declareDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    cityDao = database.cityDao;
  }

  Future<void> _checkSavedCity(
      CheckSavedCityEvent event, Emitter<SaveCityState> emit) async {
    if (cityDao == null) {
      await declareDatabase();
    }

    CityVO? cityVO = await cityDao!.findCityById(event.id!);
    if (cityVO == null) {
      emit(SavedCityState(false));
    } else {
      emit(SavedCityState(true));
    }
  }

  Future<void> _getFavCity(
      GetFvouriteCityEvent event, Emitter<SaveCityState> emit) async {
    emit(LoadingState());
    if (cityDao == null) {
      await declareDatabase();
    }

    List<CityVO> cityList = await cityDao!.getAllCity();
    List<ForecastResponse> forecastList = [];

    await Future.wait(cityList.map((city) async {
      try {
        ForecastResponse forecast =
        await weatherModel.getCityWeatherForecast(city.name ?? "", "1");
        forecast.cityVO = city;
        forecastList.add(forecast);

      }catch(error){
        print("error");
      }
      return city;
    }).toList());

    emit(GetFavourtieCityState(forecastList));
  }
}
