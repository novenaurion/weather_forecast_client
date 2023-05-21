import 'package:flutter/material.dart';
import 'package:weatherforecast/data/vos/weather_forecast_vo.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';

class TodayWeatherConditionItemView extends StatelessWidget {
  const TodayWeatherConditionItemView({
    super.key,
    required this.hourForecastVO,
  });

  final WeatherForecastVO hourForecastVO;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextView(
            textAlign: TextAlign.center,
            text:
            "${hourForecastVO.getHour() ?? ""}",
            fontSize: textRegular3X,
            fontColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          Image.network(
            "https:${hourForecastVO.conditionVO?.icon ?? ""}",
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          CustomTextView(
            textAlign: TextAlign.center,
            text:
            "${hourForecastVO.tempC ?? ""} \u2103",
            fontSize: textRegular3X,
            fontColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
