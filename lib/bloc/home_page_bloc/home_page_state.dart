import 'package:equatable/equatable.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomePageInitial extends HomepageState {
  const HomePageInitial();

  @override
  List<Object> get props => [];
}


class SearchCityLoaded extends HomepageState {
  final List<CityVO> cityList;
  const SearchCityLoaded(this.cityList);

  @override
  List<Object> get props => [cityList];
}

class HomePageError extends HomepageState {

  final String message;
  const HomePageError(this.message);

  @override
  List<Object> get props => [message];
}
