
import 'package:flutter/material.dart';
import 'package:weatherforecast/screens/city_weather_page/three_day_weather_condition_item_view.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';

class ThreeDayweatherConditionView extends StatelessWidget {
  const ThreeDayweatherConditionView({
    super.key,
    required this.forecastResponse,
  });

  final ForecastResponse forecastResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(marginDefault),
        color: Colors.white.withOpacity(0.2),
      ),
      padding: EdgeInsets.all(marginDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextView(
            text: "Three Day Weather Conditions",
            fontColor: Colors.white,
            fontSize: textRegular2X,
          ),
          Divider(height: marginDefault, color: Colors.white),
          SizedBox(
            height: marginDefault,
          ),
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ThreeDayWeatherConditionIItemView(forecastDayVO: forecastResponse.forecastVO!.forecastDayList![index],first: index==0,);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: marginDefault,
                );
              },
              itemCount: forecastResponse.forecastVO!.forecastDayList!.length),
        ],
      ),
    );
  }
}

