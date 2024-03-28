import 'package:weather_app/models/astro.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/hour.dart';

class ForecastDay {
  final DateTime date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hours;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hours,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
        date: DateTime.parse(json['date']),
        dateEpoch: json['date_epoch'],
        day: Day.fromJson(json['day']),
        astro: Astro.fromJson(json['astro']),
        hours: (json['hour'] ?? [])
            .map<Hour>((hour) => Hour.fromJson(hour))
            .toList(),
      );
}
