class AirQuality {
  final double? co;
  final double? no2;
  final double? o3;
  final double? so2;
  final double? pm25;
  final double? pm10;
  final int? usEpaIndex;
  final int? gbDefraIndex;

  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: json['co'],
        no2: json['no2'],
        o3: json['o3'],
        so2: json['so2'],
        pm25: json['pm2_5'],
        pm10: json['pm10'],
        usEpaIndex: json['us-epa-index'],
        gbDefraIndex: json['gb-defra-index'],
      );
}
