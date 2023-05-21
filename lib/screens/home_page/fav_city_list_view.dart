import 'package:flutter/material.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/forecast_response.dart';
import '../../widget/custom_text_view.dart';
import 'forecast_item_view.dart';

class FavouriteCityListView extends StatelessWidget {
  const FavouriteCityListView({
    super.key,
    required this.forecastList, required this.onTap,
  });

  final List<ForecastResponse> forecastList;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                onTap(forecastList[index]);
              },
              child: FavCityItemView(foreCast: forecastList[index]));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: marginDefault,
          );
        },
        itemCount: forecastList.length);
  }
}

