import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Screen/future_forecast_screen.dart';
import 'package:weather_app/models/hour.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/slide_animation.dart';

class HoursForecast extends ConsumerStatefulWidget {
  const HoursForecast({super.key});

  @override
  ConsumerState<HoursForecast> createState() => _HoursForecastState();
}

class _HoursForecastState extends ConsumerState<HoursForecast> {
  final scrollController = ScrollController(
    initialScrollOffset: DateTime.now().hour * (85 + 4),
  );

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeScreenProvider);
    final todayForeCast = provider.forecastData!.foreCast.forecastDay.first;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            children: [
              const SizedBox(width: 4),
              Text(
                'Today',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                elevation: 0,
                child: InkWell(
                  splashColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  highlightColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  focusColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    provider.selectedDay = provider
                        .forecastData!.foreCast.forecastDay.first.date.day;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FutureForecastScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next 7 Days',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SlideAnimation(
          // delay: 1000,
          duration: 800,
          startOffset: const Offset(0, 5),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                for (int i = 0; i < todayForeCast.hours.length; i++)
                  buildHourWeather(todayForeCast.hours[i]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHourWeather(Hour hour) {
    final isCurrentHour = DateTime.now().hour == hour.time.hour;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.babyBlue,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.cetaceanBlue,
            AppColors.catalinaBlue,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cetaceanBlue.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('hh aa').format(hour.time),
            style: GoogleFonts.poppins(
              fontSize: isCurrentHour ? 24 : 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Image.asset(
            hour.condition.icon,
            width: isCurrentHour ? 60 : 40,
            height: isCurrentHour ? 60 : 40,
          ),
          const SizedBox(height: 4),
          Text(
            '${hour.tempC.toStringAsPrecision(2)}º',
            style: GoogleFonts.poppins(
              fontSize: isCurrentHour ? 24 : 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
