// To parse this JSON data, do
//
//     final forecastDataModel = forecastDataModelFromJson(jsonString);

import 'dart:convert';

ForecastDataModel forecastDataModelFromJson(String str) => ForecastDataModel.fromJson(json.decode(str));

String forecastDataModelToJson(ForecastDataModel data) => json.encode(data.toJson());

class ForecastDataModel {
  final int? queryCost;
  final double? latitude;
  final double? longitude;
  final String? resolvedAddress;
  final String? address;
  final String? timezone;
  final double? tzoffset;
  final List<Day>? days;

  ForecastDataModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
  });

  factory ForecastDataModel.fromJson(Map<String, dynamic> json) => ForecastDataModel(
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
  final String? conditions;

  Day({
    this.datetime,
    this.temp,
    this.conditions,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        temp: json["temp"]?.toDouble(),
        conditions: json["conditions"],
      );

  Map<String, dynamic> toJson() => {
        "datetime":
            "${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}",
        "temp": temp,
        "conditions": conditions,
      };
}
