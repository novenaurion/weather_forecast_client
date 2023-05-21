import 'package:flutter/material.dart';
import 'package:weatherforecast/screens/city_weather_page/today_weather_condition_item_view.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';

class TodayWeatherConditionView extends StatelessWidget {
  const TodayWeatherConditionView({
    super.key,
    required this.forecastResponse,
  });

  final ForecastResponse forecastResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
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
            text: "Today Weather Conditions",
            fontColor: Colors.white,
            fontSize: textRegular2X,
          ),
          Divider(height: marginDefault, color: Colors.white),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TodayWeatherConditionItemView(
                      hourForecastVO: forecastResponse.forecastVO!
                          .forecastDayList![0].hourForecastList![index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: marginDefault,
                  );
                },
                itemCount: forecastResponse
                    .forecastVO!.forecastDayList![0].hourForecastList!.length),
          )
        ],
      ),
    );
  }
}
