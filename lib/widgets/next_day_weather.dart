import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/slide_animation.dart';

class NextDayWeather extends ConsumerStatefulWidget {
  const NextDayWeather({super.key});

  @override
  ConsumerState<NextDayWeather> createState() => _NextDayWeatherState();
}

class _NextDayWeatherState extends ConsumerState<NextDayWeather> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeScreenProvider);
    final selectedDay = provider.selectedDay;
    if (selectedDay ==
        provider.forecastData!.foreCast.forecastDay.last.date.day) {
      return const SizedBox();
    }
    final selectedDayIndex =
        provider.forecastData!.foreCast.forecastDay.indexWhere(
      (forecastDay) => forecastDay.date.day == selectedDay,
    );
    final nextDay =
        provider.forecastData!.foreCast.forecastDay[selectedDayIndex + 1];
    return SlideAnimation(
      delay: 600,
      startOffset: const Offset(0, 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cetaceanBlue.withOpacity(0.3)),
          color: AppColors.royalBlue,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.cetaceanBlue,
              AppColors.catalinaBlue,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.catalinaBlue.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SlideAnimation(
              delay: 1600,
              startOffset: const Offset(-2, 0),
              child: Image.asset(
                nextDay.day.condition.icon,
                width: 72,
                height: 72,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SlideAnimation(
                delay: 1200,
                startOffset: const Offset(-2, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nextDay.day.condition.text,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: DateFormat('dd MMM,').format(nextDay.date),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: DateFormat(' EEEE').format(nextDay.date),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '${nextDay.day.minTempC.toStringAsPrecision(2)}º - ${nextDay.day.maxTempC.toStringAsPrecision(2)}º',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideAnimation(
              delay: 1400,
              startOffset: const Offset(2, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 0,
                child: InkWell(
                  splashColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  highlightColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  focusColor: AppColors.cetaceanBlue.withOpacity(0.1),
                  onTap: () {
                    provider.selectedDay = nextDay.date.day;
                    provider.daysScrollController.animateTo(
                      ((selectedDayIndex + 1) * 80) + 16,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    // alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.tuftsBlue,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
