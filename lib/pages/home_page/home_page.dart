import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_bottom_widget.dart';
import 'package:weather_app/pages/home_page/widgets/mini_capsule_widget.dart';
import 'package:weather_app/pages/home_page/widgets/top_location_header.dart';
import 'package:weather_app/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TopLocationHeader(),
                            SizedBox(
                              height: 38,
                            ),
                            ThreeDImageWidget(),
                            TemperatureWidget(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 54.0, vertical: 28),
                              child: Divider(
                                height: 1,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 54.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MiniCapsuleWidget(
                                      imgPath: 'assets/weather/snow.png',
                                      txt1: "13 km/h",
                                      txt2: "wind"),
                                  MiniCapsuleWidget(
                                      imgPath: 'assets/weather/snow.png',
                                      txt1: "13 km/h",
                                      txt2: "wind"),
                                  MiniCapsuleWidget(
                                      imgPath: 'assets/weather/snow.png',
                                      txt1: "13 km/h",
                                      txt2: "wind")
                                ],
                              ),
                            )
                          ],
                        ),
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
              Container(
                height: MediaQuery.of(context).size.height * 0.175,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MiniCapsuleBottomWidget(
                          imgPath: 'assets/weather/atmosphere.png',
                          txt1: "13 km/h",
                          txt2: "wind"),
                      MiniCapsuleBottomWidget(
                          imgPath: 'assets/weather/cloud.png',
                          txt1: "13 km/h",
                          txt2: "wind"),
                      MiniCapsuleBottomWidget(
                          imgPath: 'assets/weather/clear.png',
                          txt1: "13 km/h",
                          txt2: "wind")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '21',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.white, blurRadius: 6),
                    Shadow(color: Colors.white, blurRadius: 24),
                    Shadow(color: Colors.white70, blurRadius: 58),
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
          'Thunderstorm',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          'Monday, 30 June',
          style: TextStyle(fontSize: 14, color: Colors.white54),
        )
      ],
    );
  }
}

class ThreeDImageWidget extends StatelessWidget {
  const ThreeDImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          bottom: 55,
          left: 30,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Colors.black54,
                )
              ],
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
        Image.asset(
          'assets/weather/atmosphere.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      ],
    );
  }
}
