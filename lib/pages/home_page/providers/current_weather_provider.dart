import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/data_models/current_weather_model.dart';
import 'package:weather_app/domain/weather_api.dart';
import 'package:weather_app/models/current_weather_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/data_models/error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/models/ui_state_model.dart';
import 'package:weather_app/utils/helpers.dart';

class CurrentWeatherProvider with ChangeNotifier {
  late CurrentWeatherViewModel currentWeatherViewModel;
  UiStateModel uiStateModel = UiStateModel(states: UiStates.loading);

  void getCurrentWeather() async {
    Position currPosition = await Geolocator.getCurrentPosition();
    WeatherApi weatherApi = WeatherApi();
    Either<ErrorModel, WeatherDataModel> data = await weatherApi.fetchWeatherData(currPosition.longitude, currPosition.latitude);
    data.fold((l) {
      uiStateModel.states = UiStates.failure;
      notifyListeners();
    }, (r) {
      currentWeatherViewModel = CurrentWeatherViewModel(
        cityName: r.name ?? '',
        temp: AppHelper.fahrenheitToCelsius(r.main?.temp ?? 0).ceil(),
        weatherCondition: r.weather?[0].main ?? 'clear',
        windSpeed: r.wind?.speed ?? 0,
        humidity: r.main?.humidity ?? 0,
        pressure: r.main?.pressure ?? 0,
        dtNow: AppHelper.epochToDate(r.dt),
      );
      uiStateModel.states = UiStates.success;
      notifyListeners();
    });
  }
}
