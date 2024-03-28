import 'package:weather_app/models/condition.dart';

class Hour {
  final int timeEpoch;
  final DateTime time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double snowCm;
  final int humidity;
  final int cloud;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windChillC;
  final double windChillF;
  final double heatIndexC;
  final double heatIndexF;
  final double dewPointC;
  final double dewPointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;
  final double shortRad;
  final double diffRad;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windChillC,
    required this.windChillF,
    required this.heatIndexC,
    required this.heatIndexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.shortRad,
    required this.diffRad,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json['time_epoch'],
        time: DateTime.parse(json['time']),
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        isDay: json['is_day'],
        condition: Condition.fromJson(json['condition']),
        windMph: json['wind_mph'],
        windKph: json['wind_kph'],
        windDir: json['wind_dir'],
        pressureMb: json['pressure_mb'],
        pressureIn: json['pressure_in'],
        snowCm: json['snow_cm'],
        humidity: json['humidity'],
        cloud: json['cloud'],
        feelsLikeC: json['feelslike_c'],
        feelsLikeF: json['feelslike_f'],
        windChillC: json['windchill_c'],
        windChillF: json['windchill_f'],
        heatIndexC: json['heatindex_c'],
        heatIndexF: json['heatindex_f'],
        dewPointC: json['dewpoint_c'],
        dewPointF: json['dewpoint_f'],
        willItRain: json['will_it_rain'],
        chanceOfRain: json['chance_of_rain'],
        willItSnow: json['will_it_snow'],
        chanceOfSnow: json['chance_of_snow'],
        visKm: json['vis_km'],
        visMiles: json['vis_miles'],
        gustMph: json['gust_mph'],
        gustKph: json['gust_kph'],
        uv: json['uv'],
        shortRad: json['short_rad'],
        diffRad: json['diff_rad'],
      );
}
