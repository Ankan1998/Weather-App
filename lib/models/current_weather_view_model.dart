class CurrentWeatherViewModel {
  String cityName;
  int temp;
  String weatherCondition;
  double windSpeed;
  int humidity;
  int pressure;
  DateTime dtNow;

  CurrentWeatherViewModel(
      {required this.cityName,
      required this.temp,
      required this.weatherCondition,
      required this.windSpeed,
      required this.humidity,
      required this.pressure,
      required this.dtNow});
}
