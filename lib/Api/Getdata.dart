import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/MyHomePageModel/Body.dart';

class GetDataFromApi {
  late String latitude;
  late String longitude;
  var appid = 'c232571e1587bfa439d35ca18095761b';

  late String ci = "01d";

  late String temp = "28";
  late String city = "surat";
  late String windSpeed = '';
  late String humidity = '';
  late String description = "";
  late String uvIndex = "";

  late String h1 = "";
  late String h2 = "";
  late String h3 = "";
  late String h4 = "";
  late String h5 = "";

  late String i1 = "02d";
  late String i2 = "04d";
  late String i3 = "09d";
  late String i4 = "11d";
  late String i5 = "50d";

  Future<void> getLocationWeatherData(String lat, String lon) async {
    latitude = lat;
    longitude = lon;

    print('Beforeeeee getinggg Apiiii');

    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$appid&units=metric"));
    final response2 = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appid&units=metric"));
    Map<String, dynamic> data = await jsonDecode(response.body);
    Map<String, dynamic> data2 = await jsonDecode(response2.body);
    print("DATA : $data");

    if (response.statusCode == 200) {
      temp = data['current']['temp'].toString();
      windSpeed = (data['current']['wind_speed'].toString() + " m/s");
      humidity = (data['current']['humidity'].toString() + "%");
      description = data['current']['weather'][0]['description'].toString();
      ci = data['current']['weather'][0]['icon'].toString();
      uvIndex = data['current']['uvi'].toString();
      h1 = data['hourly'][0]['temp'].round().toString() + "°";
      h2 = data['hourly'][1]['temp'].round().toString() + "°";
      h3 = data['hourly'][2]['temp'].round().toString() + "°";
      h4 = data['hourly'][3]['temp'].round().toString() + "°";
      h5 = data['hourly'][4]['temp'].round().toString() + "°";

      i1 = data['hourly'][0]['weather'][0]['icon'].toString();
      i2 = data['hourly'][1]['weather'][0]['icon'].toString();
      i3 = data['hourly'][2]['weather'][0]['icon'].toString();
      i4 = data['hourly'][3]['weather'][0]['icon'].toString();
      i5 = data['hourly'][4]['weather'][0]['icon'].toString();

      print(i1);
      print(i1);
      print(i1);
      print(i1);
      print(i1);

      // temp = data['main']['temp'].toString();
      // windSpeed = (data['wind']['speed'].toString() + " m/s");
      // humidity = (data['main']['humidity'].toString() + "%");
      // description = data['weather'][0]['description'].toString();

      // uvIndex = data['main']['uvi'].toString();

      print(temp + windSpeed + humidity + description);
    } else {
      temp = "72";
      windSpeed = "135 m/s";
      humidity = "48%";
      description = "Partly Cloudy";
      uvIndex = "0.2";
      h1 = "28°";
      h2 = "28°";
      h3 = "28°";
      h4 = "28°";
      h5 = "28°";
    }

    if (response2.statusCode == 200) {
      city = data2['name'].toString();
    } else {
      city = "surat";
    }

    print('Afterrrr getinggg Apiiii');
    // print(temp);
    // print(windSpeed);
    // print(humidity);
    // print(description);
    // print(response.body);
    // print(latitude);
    // print(longitude);
    // latitude = GetCurrentPosition().
  }
}

// Future<Album> fetchAlbum() async {
//   var latitude = 21.1667;
//   var longitude = 72.8333;
//   var appid = 'b45af9f30fd7bd11ce928ff0b8455a2e';

//   final response = await http.get(Uri.parse(
//       "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appid&units=metric"));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   // final int userId;
//   // final int id;
//   // final String title;

//   final String temp;
//   final String windSpeed;
//   final String humidity;
//   final String description;

//   const Album(
//       {required this.temp,
//       required this.humidity,
//       required this.description,
//       required this.windSpeed});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     print(json['main']['temp']);
//     print(json['wind']['speed']);
//     print(json['main']['humidity']);
//     print(json['weather'][0]['description']);
//     return Album(
//       temp: json['main']['temp'].toString(),
//       windSpeed: json['wind']['speed'].toString(),
//       humidity: json['main']['humidity'].toString(),
//       description: json['weather'][0]['description'].toString(),
//     );
//   }
// }
