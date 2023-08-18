import 'package:dio/dio.dart';
import 'package:weather_app/domain/data_models/error_model.dart';
import 'package:weather_app/utils/key.dart';
import 'package:dartz/dartz.dart';

import 'data_models/current_weather_model.dart';

class WeatherApi {
  final dio = Dio();
  Future<Either<ErrorModel, WeatherDataModel>> fetchWeatherData(double longitude, double latitude) async {
    try {
      const String key = ApiKey.apiKey;
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
}
