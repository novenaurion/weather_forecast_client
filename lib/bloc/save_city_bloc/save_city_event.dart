import 'package:equatable/equatable.dart';

import '../../data/vos/city_vo.dart';

class SaveCityEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SaveFavouriteCityEvent extends SaveCityEvent {
  CityVO? cityVO;

  SaveFavouriteCityEvent(this.cityVO);
}

class CheckSavedCityEvent extends SaveCityEvent {
  int? id;

  CheckSavedCityEvent(this.id);
}

class GetFvouriteCityEvent extends SaveCityEvent {
  GetFvouriteCityEvent();
}
