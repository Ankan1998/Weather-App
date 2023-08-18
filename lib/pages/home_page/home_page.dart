import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_view_model.dart';
import 'package:weather_app/models/ui_state_model.dart';
import 'package:weather_app/pages/home_page/providers/current_weather_provider.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_bottom_widget.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_widget.dart';
import 'package:weather_app/pages/home_page/widgets/top_location_header.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/helpers.dart';

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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                      ),
                      Consumer<CurrentWeatherProvider>(builder: (context, provider, child) {
                        if (provider.uiStateModel.states == UiStates.loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (provider.uiStateModel.states == UiStates.success) {
                          return Center(
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
                                  imgPath: provider.currentWeatherViewModel.weatherCondition,
                                ),
                                TemperatureWidget(
                                  temp: provider.currentWeatherViewModel.temp,
                                  weatherCondition: provider.currentWeatherViewModel.weatherCondition,
                                  dateTime: provider.currentWeatherViewModel.dtNow,
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
                                          imgPath: 'assets/weather/snow.png',
                                          txt1: provider.currentWeatherViewModel.windSpeed.toString(),
                                          txt2: "Wind"),
                                      MiniCapsuleWidget(
                                          imgPath: 'assets/weather/snow.png',
                                          txt1: provider.currentWeatherViewModel.humidity.toString(),
                                          txt2: "Humidity"),
                                      MiniCapsuleWidget(
                                          imgPath: 'assets/weather/snow.png',
                                          txt1: provider.currentWeatherViewModel.pressure.toString(),
                                          txt2: "Pressure")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Text("Something Went wrong"),
                          );
                        }
                      })
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
              WindHumidityPressureWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class WindHumidityPressureWidget extends StatelessWidget {
  const WindHumidityPressureWidget({
    super.key,
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
            MiniCapsuleBottomWidget(imgPath: 'assets/weather/atmosphere.png', txt1: "13 km/h", txt2: "Wind"),
            MiniCapsuleBottomWidget(imgPath: 'assets/weather/clouds.png', txt1: "13 km/h", txt2: "Humidity"),
            MiniCapsuleBottomWidget(imgPath: 'assets/weather/clear.png', txt1: "13 km/h", txt2: "Pressure")
          ],
        ),
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  final int temp;
  final String weatherCondition;
  final DateTime dateTime;
  const TemperatureWidget({
    super.key,
    required this.temp,
    required this.weatherCondition,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: temp.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.white, blurRadius: 6),
                    Shadow(color: Colors.white, blurRadius: 15),
                    Shadow(color: Colors.white70, blurRadius: 32),
                  ],
                ),
              ),
              TextSpan(
                text: 'c',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.white38, blurRadius: 3),
                    Shadow(color: Colors.white, blurRadius: 12),
                  ],
                ),
              )
            ],
          ),
        ),
        Text(
          weatherCondition,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          AppHelper.dateToString(dateTime),
          style: TextStyle(fontSize: 14, color: Colors.white54),
        )
      ],
    );
  }
}

class ThreeDImageWidget extends StatelessWidget {
  final String imgPath;
  const ThreeDImageWidget({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.09,
          bottom: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.height * 0.08,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Colors.black45,
                )
              ],
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
        Image.asset(
          'assets/weather/${imgPath.toLowerCase()}.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      ],
    );
  }
}
