import 'package:flutter/material.dart';
import 'package:weather_app/models/ui_state_model.dart';
import 'package:weather_app/models/weather_forecast_view_model.dart';
import 'package:weather_app/pages/home_page/providers/current_weather_provider.dart';
import 'package:weather_app/pages/home_page/widgets/animation_with_text_widget.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_bottom_widget.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_widget.dart';
import 'package:weather_app/pages/home_page/widgets/temperature_widget.dart';
import 'package:weather_app/pages/home_page/widgets/three_d_image_widget.dart';
import 'package:weather_app/pages/home_page/widgets/three_day_forecast_widget.dart';
import 'package:weather_app/pages/home_page/widgets/top_location_header.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<CurrentWeatherProvider>(context, listen: false).getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.xBackgroundColor,
        body: Center(
          child: Consumer<CurrentWeatherProvider>(builder: (context, provider, child) {
            if (provider.uiStateModel.states == UiStates.loading) {
              return AnimationWithTitleWidget(
                assetPath: 'assets/animations/weatherLoading.json',
                bottomText: 'Fetching Weather....',
              );
            } else if (provider.uiStateModel.states == UiStates.success) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                TopLocationHeader(
                                  cityName: provider.currentWeatherViewModel.cityName,
                                  onPressed: () {
                                    Provider.of<CurrentWeatherProvider>(context, listen: false).getCurrentWeather();
                                  },
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                ThreeDImageWidget(
                                  imgPath: provider.currentWeatherViewModel.dayForecastList[0].weatherCondition,
                                ),
                                TemperatureWidget(
                                  temp: provider.currentWeatherViewModel.dayForecastList[0].temp,
                                  weatherCondition: provider.currentWeatherViewModel.dayForecastList[0].weatherCondition,
                                  dateTime: provider.currentWeatherViewModel.dayForecastList[0].dtNow,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 54.0, vertical: 28),
                                  child: Divider(
                                    height: 1,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 54.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MiniCapsuleWidget(
                                          imgPath: 'assets/misc/windspeed.png',
                                          txt1: provider.currentWeatherViewModel.dayForecastList[0].windSpeed.toString(),
                                          txt2: "Wind"),
                                      MiniCapsuleWidget(
                                          imgPath: 'assets/misc/humidity.png',
                                          txt1: provider.currentWeatherViewModel.dayForecastList[0].humidity.toString(),
                                          txt2: "Humidity"),
                                      MiniCapsuleWidget(
                                          imgPath: 'assets/misc/uvindex.png',
                                          txt1: provider.currentWeatherViewModel.dayForecastList[0].uvindex.toString(),
                                          txt2: "Pressure")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlue[200]!,
                            Colors.lightBlue[300]!,
                            Colors.blue[600]!,
                            Colors.blue[900]!,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                      ),
                    ),
                  ),
                  ThreeDayForecastWidget(
                    day1WidgetModel: DayWidgetModel(
                        temp: provider.currentWeatherViewModel.dayForecastList[1].temp.ceil(),
                        dtNow: provider.currentWeatherViewModel.dayForecastList[1].dtNow,
                        weatherCondition: provider.currentWeatherViewModel.dayForecastList[1].weatherCondition),
                    day2WidgetModel: DayWidgetModel(
                        temp: provider.currentWeatherViewModel.dayForecastList[2].temp.ceil(),
                        dtNow: provider.currentWeatherViewModel.dayForecastList[2].dtNow,
                        weatherCondition: provider.currentWeatherViewModel.dayForecastList[2].weatherCondition),
                    day3WidgetModel: DayWidgetModel(
                        temp: provider.currentWeatherViewModel.dayForecastList[3].temp.ceil(),
                        dtNow: provider.currentWeatherViewModel.dayForecastList[3].dtNow,
                        weatherCondition: provider.currentWeatherViewModel.dayForecastList[3].weatherCondition),
                  )
                ],
              );
            } else {
              return AnimationWithTitleWidget(
                assetPath: 'assets/animations/wrong.json',
                bottomText: 'Something Failed!',
              );
            }
          }),
        ),
      ),
    );
  }
}
