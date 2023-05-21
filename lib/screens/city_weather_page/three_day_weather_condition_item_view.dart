
import 'package:flutter/material.dart';
import 'package:weatherforecast/data/vos/forecast_day_vo.dart';

import '../../constant/dimen_constant.dart';
import '../../widget/custom_text_view.dart';

class ThreeDayWeatherConditionIItemView extends StatelessWidget {
  const ThreeDayWeatherConditionIItemView({
    super.key,
    required this.forecastDayVO, required this.first,
  });

  final ForecastDayVO forecastDayVO;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: CustomTextView(
            text:first==true?"Today": forecastDayVO
                .getDate(),
            fontColor: Colors.white,
            fontSize: textRegular3X,
          ),
        ),
        SizedBox(
          width: marginDefault,
        ),
        Image.network(
          "https:${forecastDayVO.dayForecastVO!.conditionVO?.icon ?? ""}",
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: marginDefault,
        ),
        SizedBox(
          width: 80,
          child: CustomTextView(
            text:
            " ${forecastDayVO.dayForecastVO!.minTempC ?? ""} \u2103",
            fontColor: Colors.white,
            fontSize: textRegular3X,
          ),
        ),
        SizedBox(
          width: marginDefault,
        ),
        CustomTextView(
          text: "To",
          fontColor: Colors.white,
          fontSize: textRegular3X,
        ),
        SizedBox(
          width: marginDefault,
        ),
        SizedBox(
          width: 80,
          child: CustomTextView(
            text:
            " ${forecastDayVO.dayForecastVO!.maxTempC ?? ""} \u2103",
            fontColor: Colors.white,
            fontSize: textRegular3X,
          ),
        ),
      ],
    );
  }
}
