import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast_view_model.dart';
import 'package:geocoding/geocoding.dart';
import '../domain/data_models/weather_forecast_model.dart';

class AppHelper {
  static Map<String, String> weatherAssetMap = {
    '': 'clear',
    'type_1': 'snow',
    'type_10': 'snow',
    'type_11': 'snow',
    'type_12': 'snow',
    'type_13': 'rain',
    'type_14': 'rain',
    'type_15': 'atmosphere',
    'type_16': 'rain',
    'type_17': 'snow',
    'type_18': 'thunderstorm',
    'type_19': 'atmosphere',
    'type_2': 'drizzle',
    'type_20': 'drizzle',
    'type_21': 'rain',
    'type_22': 'rain',
    'type_23': 'rain',
    'type_24': 'rain',
    'type_25': 'rain',
    'type_26': 'rain',
    'type_27': 'clouds',
    'type_28': 'clouds',
    'type_29': 'clear',
    'type_3': 'drizzle',
    'type_30': 'atmosphere',
    'type_31': 'snow',
    'type_32': 'snow',
    'type_33': 'snow',
    'type_34': 'snow',
    'type_35': 'snow',
    'type_36': 'snow',
    'type_37': 'thunderstorm',
    'type_38': 'thunderstorm',
    'type_39': 'atmosphere',
    'type_4': 'drizzle',
    'type_40': 'rain',
    'type_41': 'clouds',
    'type_42': 'clouds',
    'type_43': 'clear',
    'type_5': 'rain',
    'type_6': 'drizzle',
    'type_7': 'atmosphere',
    'type_8': 'atmosphere',
  };
  static DateTime epochToDate(int? epoch) {
    if (epoch == null) {
      return DateTime.now();
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    return dateTime;
  }

  static String dateToString(DateTime dt) {
    String formattedDate = DateFormat('EEEE d, MMMM').format(dt);
    return formattedDate;
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static String? weatherToAssetMapper(String? conditionCode) {
    if (conditionCode != null) {
      return weatherAssetMap[conditionCode.split(",")[0]]!;
    } else {
      return null;
    }
  }

  static Future<List<DayForecast>> viewModelToDataModel(WeatherForecastDataModel? weatherForecastDataModel) async {
    List<DayForecast> dayForecastList = [];
    if (weatherForecastDataModel?.days != null) {
      dayForecastList = weatherForecastDataModel!.days!.map((day) {
        return DayForecast(
          temp: day.temp?.ceil() ?? 0,
          dtNow: day.datetime ?? DateTime.now(),
          weatherCondition: weatherToAssetMapper(day.conditions) ?? 'atmosphere',
          windSpeed: day.windspeed ?? 0.0,
          humidity: day.humidity ?? 0.0,
          uvindex: day.uvindex ?? 0.0,
        );
      }).toList();
    }
    return dayForecastList;
  }

  static String capitalizeString(String word) {
    return word[0].toUpperCase() + word.substring(1);
  }

  static String formatDateToMD(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }
}
