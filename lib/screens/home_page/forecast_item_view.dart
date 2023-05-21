import 'package:flutter/material.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';

class FavCityItemView extends StatelessWidget {
  const FavCityItemView({
    super.key,
    required this.foreCast,
  });

  final ForecastResponse foreCast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(marginDefault),
        color: Colors.white.withOpacity(0.2),
      ),
      padding: EdgeInsets.all(marginDefault),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextView(
                text: foreCast.cityVO!.name ?? "",
                fontSize: textHeading2X,
                fontColor: Colors.white,
              ),
              SizedBox(
                height: marginSmall,
              ),
              CustomTextView(
                text:
                "${foreCast.currentForecast?.tempC ?? ""} \u2103",
                fontSize: textHeading2X,
                fontColor: Colors.white,
              ),
              SizedBox(
                height: marginSmall,
              ),
              CustomTextView(
                text: foreCast
                    .currentForecast
                    ?.conditionVO
                    ?.text ??
                    "",
                fontSize: textHeading2X,
                fontColor: Colors.white,
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Image.network(
                "https:${foreCast.currentForecast?.conditionVO?.icon ?? ""}",
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
