class LocationData {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double long;
  final String timeZone;
  final int localTimeEpoch;
  final String localTime;

  LocationData({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.long,
    required this.timeZone,
    required this.localTimeEpoch,
    required this.localTime,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        lat: json['lat'],
        long: json['lon'],
        timeZone: json['tz_id'],
        localTimeEpoch: json['localtime_epoch'],
        localTime: json['localtime'],
      );
}
