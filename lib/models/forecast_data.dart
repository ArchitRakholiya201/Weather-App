import 'package:weather_app/models/alert.dart';
import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location_data.dart';

class ForecastData {
  final LocationData location;
  final Current current;
  final Forecast foreCast;
  final List<Alert> alerts;

  ForecastData({
    required this.location,
    required this.current,
    required this.foreCast,
    required this.alerts,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) => ForecastData(
        location: LocationData.fromJson(json['location']),
        current: Current.fromJson(json['current']),
        foreCast: Forecast.fromJson(json['forecast']),
        alerts: (json['alerts']?['alert'] ?? [])
            .map<Alert>((alert) => Alert.fromJson(alert))
            .toList(),
      );
}
