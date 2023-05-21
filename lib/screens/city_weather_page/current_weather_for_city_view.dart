import 'package:flutter/material.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';

class CurrentWeatherForCityView extends StatelessWidget {
  const CurrentWeatherForCityView({
    super.key,
    required this.forecastResponse,
  });

  final ForecastResponse forecastResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: marginMedium3,
          ),
          Image.network(
              "https:${forecastResponse.currentForecast?.conditionVO?.icon ?? ""}"),
          CustomTextView(
            text: "${forecastResponse.currentForecast?.tempC ?? ""} \u2103",
            fontSize: textTempSize,
            fontColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          CustomTextView(
            text: forecastResponse.currentForecast?.conditionVO?.text ?? "",
            fontSize: textHeading,
            fontColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
