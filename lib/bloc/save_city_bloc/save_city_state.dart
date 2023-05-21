import 'package:equatable/equatable.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';

abstract class SaveCityState extends Equatable {
  const SaveCityState();
}

class SaveCityInitial extends SaveCityState {
  const SaveCityInitial();

  @override
  List<Object> get props => [];
}

class SavedCityState extends SaveCityState {
  final bool isSaved;

  const SavedCityState(this.isSaved);

  @override
  List<Object> get props => [isSaved];
}

class LoadingState extends SaveCityState {
  const LoadingState();
  @override
  List<Object> get props => [];
}


class GetFavourtieCityState extends SaveCityState {
  final List<ForecastResponse> favCityForecastList;

  const GetFavourtieCityState(this.favCityForecastList);

  @override
  List<Object> get props => [favCityForecastList];
}
