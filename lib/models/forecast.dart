import 'package:weather_app/models/forecast_day.dart';

class Forecast {
  final List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastDay: (json['forecastday'] ?? [])
            .map<ForecastDay>((forecast) => ForecastDay.fromJson(forecast))
            .toList(),
      );
}
