import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_event.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_state.dart';
import 'package:weatherforecast/data/model/weather_model.dart';

import '../../data/model/impl/weather_model_impl.dart';
import '../../data/vos/city_vo.dart';
class HomePageBloc extends Bloc<HomePageEvent, HomepageState> {
  static final HomePageBloc _singleton = HomePageBloc._internal();

  factory HomePageBloc() {
    return _singleton;
  }

  HomePageBloc._internal() : super(const HomePageInitial()) {
    on<SearchCityEvent>(_onSearchCity);
  }

  WeatherModel weatherModel = WeatherModelImpl();

  Future<FutureOr<void>> _onSearchCity(
      SearchCityEvent event, Emitter<HomepageState> emit) async {
    print("hello name==>${event.name}");
    try {
      List<CityVO> cityList = await _getAllCities(event.name ?? "");
      emit(SearchCityLoaded(cityList));
    } catch (error) {
      emit(HomePageError(error.toString()));
    }
  }

  Future<List<CityVO>> _getAllCities(String name) async {
    List<CityVO> cityList = await weatherModel.getCities(name);
    return cityList;
  }
}
