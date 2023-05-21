import 'package:equatable/equatable.dart';

import '../../data/vos/city_vo.dart';

class CityWeatherPageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCityWeatherEvent extends CityWeatherPageEvent {
  String? name;

  GetCityWeatherEvent(this.name);
}

