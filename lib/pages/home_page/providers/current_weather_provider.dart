import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/data_models/weather_forecast_model.dart';
import 'package:weather_app/domain/weather_api.dart';
import 'package:weather_app/models/weather_forecast_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/data_models/error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/models/ui_state_model.dart';
import 'package:weather_app/utils/helpers.dart';
import 'package:geocoding/geocoding.dart';

class CurrentWeatherProvider with ChangeNotifier {
  late WeatherForecastViewModel currentWeatherViewModel;
  UiStateModel uiStateModel = UiStateModel(states: UiStates.loading);

  void getCurrentWeather() async {
    Position currPosition = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(currPosition.latitude, currPosition.longitude);
    WeatherApi weatherApi = WeatherApi();
    Either<ErrorModel, WeatherForecastDataModel> data = await weatherApi.fetchForecastWeatherData(currPosition.longitude, currPosition.latitude);
    data.fold((l) {
      uiStateModel.states = UiStates.failure;
      notifyListeners();
    }, (r) async {
      currentWeatherViewModel = WeatherForecastViewModel(
        cityName: placemarks[0].locality ?? "",
        dayForecastList: await AppHelper.viewModelToDataModel(r),
      );
      uiStateModel.states = UiStates.success;
      notifyListeners();
    });
  }
}
