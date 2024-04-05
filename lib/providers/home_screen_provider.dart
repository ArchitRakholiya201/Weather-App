import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/backend/api.dart';
import 'package:weather_app/models/forecast_data.dart';

final homeScreenProvider = ChangeNotifierProvider(
  (ref) => HomeScreenProvider(),
);

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = true;
  ForecastData? forecastData;
  Position? position;

  final daysScrollController = ScrollController();

  int _selectedDay = DateTime.now().day;
  int get selectedDay => _selectedDay;
  set selectedDay(int day) {
    _selectedDay = day;
    notifyListeners();
  }

  Future<void> fetchTodayForecast() async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
    }
    await getCurrentLocation();
    if (position?.latitude != null) {
      final response = await Api.fetchTodayForecast(
        latitude: position!.latitude,
        longitude: position!.longitude,
      );
      if (response != null && response.statusCode == 200) {
        final data = jsonDecode(response.body);
        forecastData = ForecastData.fromJson(data);
        _selectedDay = forecastData!.foreCast.forecastDay.first.date.day;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      debugPrint('---->>> Error getting location $e');
    }
  }
}
