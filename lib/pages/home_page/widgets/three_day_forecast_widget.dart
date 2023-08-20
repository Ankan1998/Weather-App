import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_view_model.dart';
import 'package:weather_app/utils/helpers.dart';

import 'mini_capsule_bottom_widget.dart';

class ThreeDayForecastWidget extends StatelessWidget {
  final DayWidgetModel day1WidgetModel;
  final DayWidgetModel day2WidgetModel;
  final DayWidgetModel day3WidgetModel;
  const ThreeDayForecastWidget({
    super.key,
    required this.day1WidgetModel,
    required this.day2WidgetModel,
    required this.day3WidgetModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.175,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MiniCapsuleBottomWidget(
                imgPath: 'assets/weather/${day1WidgetModel.weatherCondition}.png',
                txt1: day1WidgetModel.temp.toString(),
                txt2: AppHelper.formatDateToMD(day1WidgetModel.dtNow)),
            MiniCapsuleBottomWidget(
                imgPath: 'assets/weather/${day2WidgetModel.weatherCondition}.png',
                txt1: day2WidgetModel.temp.toString(),
                txt2: AppHelper.formatDateToMD(day2WidgetModel.dtNow)),
            MiniCapsuleBottomWidget(
                imgPath: 'assets/weather/${day3WidgetModel.weatherCondition}.png',
                txt1: day3WidgetModel.temp.toString(),
                txt2: AppHelper.formatDateToMD(day3WidgetModel.dtNow))
          ],
        ),
      ),
    );
  }
}
