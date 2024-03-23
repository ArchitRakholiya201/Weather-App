import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';
import 'Container.dart';
import 'ColumnContent.dart';
import 'RawContent.dart';
import 'DetailsRaw.dart';
import 'package:weather_app/Api/Getdata.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/Location/GetCurrentLocation.dart';

import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  late String temp = '';
  late String windSpeed = '';
  late String humidity = '';
  late String description = '';

  late AnimationController animationController;

  Body({required this.animationController});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  GetDataFromApi apiData = GetDataFromApi();

  Future<int> getLocation() async {
    Location location = Location();
    position = await location.GetCurrentLocation();
    latitude = position.latitude;
    longitude = position.longitude;

    print("Latitude : $latitude");
    print("Latitude : $longitude");

    await apiData.getLocationWeatherData(
        latitude.toString(), longitude.toString());
    // await apiData.getLocationWeatherData(
    //     (21.1667).toString(), (72.8333).toString());

    // latitude = location.latitude;
    // longitude = location.longitude;

    return 1;
  }

  // GetDataFromApi getdata = GetDataFromApi();

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset.zero,
      ).animate(widget.animationController),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Text(
              apiData.city,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3),
            ),
            Text(
              (double.parse(apiData.temp).round()).toString() + "°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(
              image: AssetImage("assets/images/${apiData.ci}.png"),
            ),
            Text(
              apiData.description,
              style: kweather,
            ),
            const Padding(
              padding: EdgeInsets.all(3),
            ),
            Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: kweatherDate,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
            ),
            BodyContainer(
              wid: 320.0,
              hei: 170.0,
              gradient: c1,
              blurRadius: 20.0,
              ofset: Offset(0.0, 3.0),
              borderRadius: 25.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Text(
                      //   "Ysesterday",
                      //   style: kweatherDay,
                      // ),
                      Text(
                        "Today",
                        style: kweatherDay,
                      ),
                      // Text(
                      //   "Tomorow",
                      //   style: kweatherDay,
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColumnContent(
                        time: DateFormat()
                            .add_j()
                            .format(DateTime.now())
                            .toString(),
                        imag: "assets/images/${apiData.i1}.png",
                        temp: apiData.h1,
                      ),
                      ColumnContent(
                        time: DateFormat()
                            .add_j()
                            .format(DateTime.now().add(Duration(hours: 1)))
                            .toString(),
                        imag: "assets/images/${apiData.i2}.png",
                        temp: apiData.h2,
                      ),
                      ColumnContent(
                        time: DateFormat()
                            .add_j()
                            .format(DateTime.now().add(
                              Duration(hours: 2),
                            ))
                            .toString(),
                        imag: "assets/images/${apiData.i3}.png",
                        temp: apiData.h3,
                      ),
                      ColumnContent(
                        time: DateFormat()
                            .add_j()
                            .format(DateTime.now().add(
                              Duration(hours: 3),
                            ))
                            .toString(),
                        imag: "assets/images/${apiData.i4}.png",
                        temp: apiData.h4,
                      ),
                      ColumnContent(
                        time: DateFormat()
                            .add_j()
                            .format(DateTime.now().add(
                              Duration(hours: 4),
                            ))
                            .toString(),
                        imag: "assets/images/${apiData.i5}.png",
                        temp: apiData.h5,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            DetailsRaw(
              img1: "assets/images/13d.png",
              txt1: apiData.temp + "°",
              text1: "Celsius",
              img2: "assets/images/50d.png",
              txt2: apiData.windSpeed,
              text2: "Wind Speed",
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            DetailsRaw(
              img1: "assets/images/01d.png",
              txt1: apiData.uvIndex,
              text1: "UV Index",
              img2: "assets/images/09d.png",
              txt2: apiData.humidity,
              text2: "Humidity",
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }
}
