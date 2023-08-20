import 'package:dio/dio.dart';
import 'package:weather_app/domain/data_models/error_model.dart';
import 'package:weather_app/utils/key.dart';
import 'package:dartz/dartz.dart';

import 'data_models/weather_forecast_model.dart';

class WeatherApi {
  final dio = Dio();

  Future<Either<ErrorModel, WeatherForecastDataModel>> fetchForecastWeatherData(double longitude, double latitude) async {
    try {
      const String key = ApiKey.visualCrossingApiKey;
      final Response response = await dio.get(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$latitude,$longitude/next3days?key=$key&include=days&elements=temp,conditions,datetime,humidity,uvindex,windspeed&lang=id');
      WeatherForecastDataModel forecastDataModel = WeatherForecastDataModel.fromJson(response.data);
      return Right(forecastDataModel);
    } catch (e) {
      print(e);
      return Left(
        ErrorModel(message: "Something Went wrong", error: ErrorType.generalError),
      );
    }
  }
}
