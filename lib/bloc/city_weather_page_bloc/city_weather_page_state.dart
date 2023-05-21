import 'package:equatable/equatable.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';

abstract class CityWeatherPageState extends Equatable {
  const CityWeatherPageState();
}

class CityWeatherPageInitial extends CityWeatherPageState {
  const CityWeatherPageInitial();

  @override
  List<Object> get props => [];
}

class CityWeatherPageLoadedState extends CityWeatherPageState {
  final ForecastResponse forecastResponse;
  const CityWeatherPageLoadedState(this.forecastResponse);

  @override
  List<Object> get props => [forecastResponse];
}

class CityWeatherPageLoadingState extends CityWeatherPageState {
  const CityWeatherPageLoadingState();

  @override
  List<Object> get props => [];
}

class CityWeatherPageErrorState extends CityWeatherPageState {
  final String message;
  const CityWeatherPageErrorState(this.message);

  @override
  List<Object> get props => [message];
}

