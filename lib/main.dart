import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:weather_app/pages/home_page/providers/current_weather_provider.dart';
import 'package:weather_app/pages/lock_page/lock_page.dart';
import 'package:weather_app/pages/lock_page/providers/lock_page_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LockPageProvider()),
        ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.xBackgroundColor),
        useMaterial3: true,
      ),
      home: const LockPage(),
    );
  }
}
