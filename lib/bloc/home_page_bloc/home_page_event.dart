import 'package:equatable/equatable.dart';

class HomePageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchCityEvent extends HomePageEvent {
  String? name;

  SearchCityEvent(this.name);
}
