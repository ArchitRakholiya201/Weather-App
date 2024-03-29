import 'package:weather_app/models/air_quality.dart';
import 'package:weather_app/models/condition.dart';

class Current {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelLikeC;
  final double feelLikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;
  final AirQuality airQuality;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelLikeC,
    required this.feelLikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'],
        lastUpdated: json['last_updated'],
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        isDay: json['is_day'],
        condition: Condition.fromJson(
          json['condition'],
        ),
        cloud: json['cloud'],
        feelLikeC: json['feelslike_c'],
        feelLikeF: json['feelslike_f'],
        gustKph: json['gust_kph'],
        gustMph: json['gust_mph'],
        humidity: json['humidity'],
        precipIn: json['precip_in'],
        precipMm: json['precip_mm'],
        pressureMb: json['pressure_mb'],
        pressureIn: json['pressure_in'],
        uv: json['uv'],
        visKm: json['vis_km'],
        visMiles: json['vis_miles'],
        windDegree: json['wind_degree'],
        windDir: json['wind_dir'],
        windKph: json['wind_kph'],
        windMph: json['wind_mph'],
        airQuality: AirQuality.fromJson(json['air_quality']),
      );
}
