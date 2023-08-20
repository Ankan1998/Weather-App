// To parse this JSON data, do
//
//     final weatherForecastDataModel = weatherForecastDataModelFromJson(jsonString);

import 'dart:convert';

WeatherForecastDataModel weatherForecastDataModelFromJson(String str) => WeatherForecastDataModel.fromJson(json.decode(str));

String weatherForecastDataModelToJson(WeatherForecastDataModel data) => json.encode(data.toJson());

class WeatherForecastDataModel {
  final int? queryCost;
  final double? latitude;
  final double? longitude;
  final String? resolvedAddress;
  final String? address;
  final String? timezone;
  final double? tzoffset;
  final List<Day>? days;

  WeatherForecastDataModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
  });

  factory WeatherForecastDataModel.fromJson(Map<String, dynamic> json) => WeatherForecastDataModel(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        timezone: json["timezone"],
        tzoffset: json["tzoffset"]?.toDouble(),
        days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "timezone": timezone,
        "tzoffset": tzoffset,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
      };
}

class Day {
  final DateTime? datetime;
  final double? temp;
  final double? humidity;
  final double? windspeed;
  final double? uvindex;
  final String? conditions;

  Day({
    this.datetime,
    this.temp,
    this.humidity,
    this.windspeed,
    this.uvindex,
    this.conditions,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        temp: json["temp"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        uvindex: json["uvindex"]?.toDouble(),
        conditions: json["conditions"],
      );

  Map<String, dynamic> toJson() => {
        "datetime":
            "${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}",
        "temp": temp,
        "humidity": humidity,
        "windspeed": windspeed,
        "uvindex": uvindex,
        "conditions": conditions,
      };
}
