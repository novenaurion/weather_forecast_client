import 'package:flutter/material.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_state.dart';
import 'package:weatherforecast/data/vos/city_vo.dart';
import 'package:weatherforecast/screens/city_weather_page/city_weather_page.dart';
import 'package:weatherforecast/screens/home_page/home_page.dart';

class RouteGenerator {
  static const routeHome = "/home";
  static const routeCityWeather = "/city";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        final page = HomePage();
        return MaterialPageRoute(builder: (context) => page);

      case routeCityWeather:
        final cityVO=settings.arguments as CityVO;
        final page = CityWeatherPage(cityVO: cityVO,);
        return MaterialPageRoute(builder: (context) => page);

      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

}