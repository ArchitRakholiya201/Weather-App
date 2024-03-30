import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/day_weather_details.dart';
import 'package:weather_app/widgets/next_day_weather.dart';
import 'package:weather_app/widgets/next_days_list.dart';

class FutureForecastScreen extends StatefulWidget {
  const FutureForecastScreen({super.key});

  @override
  State<FutureForecastScreen> createState() => _FutureForecastScreenState();
}

class _FutureForecastScreenState extends State<FutureForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.royalBlue,
              AppColors.blueJeans,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: InkWell(
                        splashColor: AppColors.cetaceanBlue.withOpacity(0.1),
                        highlightColor: AppColors.cetaceanBlue.withOpacity(0.1),
                        focusColor: AppColors.cetaceanBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.pop(context),
                        child: Ink(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.tuftsBlue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Next 7 Days',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NextDaysList(),
                      DayWeatherDetails(),
                      NextDayWeather(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
