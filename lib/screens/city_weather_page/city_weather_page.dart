import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_bloc.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_event.dart';
import 'package:weatherforecast/bloc/city_weather_page_bloc/city_weather_page_state.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_bloc.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_event.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_state.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';
import 'package:weatherforecast/screens/city_weather_page/three_day_weather_conditioin_view.dart';
import 'package:weatherforecast/screens/city_weather_page/today_weather_condition_view.dart';
import 'package:weatherforecast/widget/custom_text_view.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/city_vo.dart';
import 'current_weather_for_city_view.dart';

class CityWeatherPage extends StatelessWidget {
  const CityWeatherPage({Key? key, required this.cityVO}) : super(key: key);

  final CityVO cityVO;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CityWeatherPageBloc>(context);
    final saveCityBloc = BlocProvider.of<SaveCityBloc>(context);
    saveCityBloc.add(CheckSavedCityEvent(cityVO.cityId));
    bloc.add(GetCityWeatherEvent(cityVO.name));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: CustomTextView(
          text: cityVO.name ?? "",
          fontColor: Colors.white,
          fontSize: textRegular3X,
        ),
        actions: [
          BlocBuilder<SaveCityBloc, SaveCityState>(
              bloc: saveCityBloc,
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      saveCityBloc.add(SaveFavouriteCityEvent(cityVO));
                    },
                    icon: state is SavedCityState
                        ? Icon(
                            Icons.favorite,
                            color: state.isSaved == true
                                ? Colors.red
                                : Colors.white,
                          )
                        : Icon(
                            Icons.favorite,
                          ));
              })
        ],
      ),
      body: BlocBuilder<CityWeatherPageBloc, CityWeatherPageState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is CityWeatherPageLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CityWeatherPageLoadedState) {
              ForecastResponse forecastResponse = state.forecastResponse;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(marginDefault),
                  child: Column(
                    children: [
                      CurrentWeatherForCityView(
                          forecastResponse: forecastResponse),
                      SizedBox(
                        height: marginMedium3,
                      ),
                      TodayWeatherConditionView(
                          forecastResponse: forecastResponse),
                      SizedBox(
                        height: marginMedium3,
                      ),
                      ThreeDayweatherConditionView(
                          forecastResponse: forecastResponse),
                      SizedBox(
                        height: marginDefault,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("hello it's initial"),
              );
            }
          }),
    );
  }
}
