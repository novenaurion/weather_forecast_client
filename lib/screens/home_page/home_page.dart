import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_event.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_state.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_bloc.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_event.dart';
import 'package:weatherforecast/bloc/save_city_bloc/save_city_state.dart';
import 'package:weatherforecast/constant/dimen_constant.dart';
import 'package:weatherforecast/constant/string_constant.dart';
import 'package:weatherforecast/data/vos/forecast_response.dart';
import 'package:weatherforecast/screens/home_page/search_city_result_view.dart';
import 'package:weatherforecast/screens/home_page/search_field_view.dart';
import 'package:weatherforecast/widget/custom_text_view.dart';

import '../../bloc/home_page_bloc/home_page_bloc.dart';
import '../../helper/route.dart';
import 'fav_city_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomePageBloc>(context);
    final saveCityBloc = BlocProvider.of<SaveCityBloc>(context);
    saveCityBloc.add(GetFvouriteCityEvent());
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const CustomTextView(
          text: sAppBarTitle,
          fontColor: Colors.white,
          fontSize: textRegular3X,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(marginDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<HomePageBloc, HomepageState>(
                bloc: bloc,
                builder: (context, state) {
                  print("stae=+>$state");
                  return Column(
                    children: [
                      SearchFieldView(
                        onSearchSubmitted: (name) {
                          bloc.add(SearchCityEvent(name));
                        },
                      ),
                      const SizedBox(
                        height: marginDefault,
                      ),
                      state is SearchCityLoaded
                          ? SearchCityResultView(
                              cityList: state.cityList,
                              onClick: (cityVO) {
                                Navigator.of(context)
                                    .pushNamed(RouteGenerator.routeCityWeather,
                                        arguments: cityVO)
                                    .then((value) {
                                  bloc.emit(HomePageInitial());
                                  saveCityBloc.add(GetFvouriteCityEvent());
                                });
                              },
                            )
                          : state is HomePageError
                              ? Center(
                                  child: CustomTextView(
                                    text: state.message,
                                    fontColor: Colors.white,
                                    fontSize: textRegular2XX,
                                  ),
                                )
                              : Container()
                    ],
                  );
                },
              ),
              SizedBox(
                height: marginLarge,
              ),
              const CustomTextView(
                text: "Your favourite Cities",
                fontColor: Colors.white,
                fontSize: textRegular2XX,
              ),
              const SizedBox(
                height: marginDefault,
              ),
              BlocBuilder<SaveCityBloc, SaveCityState>(
                bloc: saveCityBloc,
                builder: (context, state) {
                  print("stae=+>$state");
                  if (state is GetFavourtieCityState) {
                    List<ForecastResponse> forecastList =
                        state.favCityForecastList;
                    if (state.favCityForecastList.isEmpty) {
                      return Center(
                        child: CustomTextView(
                          text: "There is no city yet",
                          fontColor: Colors.white,
                          fontSize: textRegular2XX,
                        ),
                      );
                    }
                    return FavouriteCityListView(
                      forecastList: forecastList,
                      onTap: (ForecastResponse forecastResponse) {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.routeCityWeather,
                                arguments: forecastResponse.cityVO)
                            .then((value) {
                          bloc.emit(HomePageInitial());
                          saveCityBloc.add(GetFvouriteCityEvent());
                        });
                      },
                    );
                  } else if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
