class CurrentWeatherViewModel {
  final String cityName;
  final int temp;
  final String weatherCondition;
  final int windSpeed;
  final int humidity;
  final int pressure;
  final DateTime dtNow;

  CurrentWeatherViewModel(this.cityName, this.temp, this.weatherCondition,
      this.windSpeed, this.humidity, this.pressure, this.dtNow);
}
