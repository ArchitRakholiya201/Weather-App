import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'http://api.weatherapi.com/v1';
  static const apiKey = 'd1cc866de54b49d0981100355242803';

  static Future<http.Response?> fetchTodayForecast({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/forecast.json?key=$apiKey&q=$latitude, $longitude&days=7&aqi=yes&alerts=yes'),
      );
      print('====>>>> ${response.statusCode}');
      print('====>>>> ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('---->>> data $data');
      }
      return response;
    } catch (e) {
      debugPrint('====>>>> Error in fetch today forecast : $e');
    }
    return null;
  }
}
