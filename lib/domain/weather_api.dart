import 'package:dio/dio.dart';
import 'package:weather_app/domain/data_models/error_model.dart';
import 'package:weather_app/utils/key.dart';
import 'package:dartz/dartz.dart';

import 'data_models/current_weather_model.dart';
import 'data_models/forecast_weather_model.dart';

class WeatherApi {
  final dio = Dio();
  Future<Either<ErrorModel, WeatherDataModel>> fetchWeatherData(double longitude, double latitude) async {
    try {
      const String key = ApiKey.openWeatherApiKey;
      final Response response = await dio.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$key');
      WeatherDataModel weatherDataModel = WeatherDataModel.fromJson(response.data);
      return Right(weatherDataModel);
    } catch (e) {
      print(e);
      return Left(
        ErrorModel(message: "Something Went wrong", error: ErrorType.generalError),
      );
    }
  }

  Future<Either<ErrorModel, ForecastDataModel>> fetchForecastWeatherData(double longitude, double latitude) async {
    try {
      const String key = ApiKey.visualCrossingApiKey;
      final Response response = await dio.get(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$latitude,$longitude/next3days?key=$key&include=days&elements=temp,conditions,datetime&lang=id');
      ForecastDataModel forecastDataModel = ForecastDataModel.fromJson(response.data);
      return Right(forecastDataModel);
    } catch (e) {
      print(e);
      return Left(
        ErrorModel(message: "Something Went wrong", error: ErrorType.generalError),
      );
    }
  }
}
