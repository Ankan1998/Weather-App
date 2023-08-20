import '../domain/data_models/weather_forecast_model.dart';

class WeatherForecastViewModel {
  String cityName;
  List<DayForecast> dayForecastList;

  WeatherForecastViewModel({
    required this.cityName,
    required this.dayForecastList,
  });
}

class DayForecast {
  int temp;
  DateTime dtNow;
  String weatherCondition;
  double windSpeed;
  double humidity;
  double uvindex;

  DayForecast({
    required this.temp,
    required this.dtNow,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
    required this.uvindex,
  });
}

class DayWidgetModel {
  int temp;
  DateTime dtNow;
  String weatherCondition;

  DayWidgetModel({required this.temp, required this.dtNow, required this.weatherCondition});
}
