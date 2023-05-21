import 'package:flutter/material.dart';
import 'package:weatherforecast/bloc/home_page_bloc/home_page_state.dart';

import '../../constant/dimen_constant.dart';
import '../../data/vos/city_vo.dart';
import '../../widget/custom_text_view.dart';

class SearchCityResultView extends StatelessWidget {
  const SearchCityResultView({
    super.key,
    required this.cityList,
    required this.onClick,
  });

  final List<CityVO> cityList;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextView(
          text: "Search Result",
          fontColor: Colors.white,
          fontSize: textRegular2XX,
        ),
        const SizedBox(
          height: marginDefault,
        ),
        cityList.isEmpty?Center(
          child: CustomTextView(
            text: "There is no city",
            fontColor: Colors.white,
            fontSize: textRegular2XX,
          ),
        ):ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onClick(cityList[index]);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: marginMedium),
                child: CustomTextView(
                  text: cityList[index].name ?? "",
                  fontSize: textRegular2X,
                  fontColor: Colors.white,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: marginDefault,
              color: Colors.grey,
            );
          },
          itemCount: cityList.length,
        ),
      ],
    );
  }
}
