import 'package:flutter/material.dart';

import '../../../utils/helpers.dart';

class TemperatureWidget extends StatelessWidget {
  final double temp;
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
        SizedBox(
          height: 8,
        ),
        Text(
          AppHelper.capitalizeString(weatherCondition),
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
