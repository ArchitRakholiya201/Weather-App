// import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'Screen/MyHomePage.dart';
import 'Api/Getdata.dart';
import 'Location/GetCurrentLocation.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var latitude;
  var longitude;
  late Position position;

  @override
  void initState() {
    super.initState();

    print('Helllooo I amm Init state');
    getLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<int> getLocation() async {
    print("I am In get Location");
    Location location = Location();
    position = await location.GetCurrentLocation();
    GetDataFromApi apiData = GetDataFromApi();
    latitude = position.latitude;
    longitude = position.longitude;

    print("Latitude : $latitude");
    print("Latitude : $longitude");

    await apiData.getLocationWeatherData(
        location.latitude.toString(), location.longitude.toString());
    // await apiData.getLocationWeatherData(
    //     (21.1667).toString(), (72.8333).toString());

    return 1;
  }

  set setLatitude(double lat) {
    latitude = lat;
  }

  set setLongitude(double lat) {
    latitude = lat;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: FutureBuilder(
          future: getLocation(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage(title: 'Flutter Weather');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
