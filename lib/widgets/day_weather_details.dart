import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/slide_animation.dart';

class DayWeatherDetails extends ConsumerStatefulWidget {
  const DayWeatherDetails({super.key});

  @override
  ConsumerState<DayWeatherDetails> createState() => _DayWeatherDetailsState();
}

class _DayWeatherDetailsState extends ConsumerState<DayWeatherDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeScreenProvider);
    final selectedDay = provider.selectedDay;
    final day = provider.forecastData!.foreCast.forecastDay.firstWhere(
      (forecastDay) => forecastDay.date.day == selectedDay,
    );
    return SlideAnimation(
      startOffset: const Offset(0, 1),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          border: Border.all(color: AppColors.cetaceanBlue.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppColors.catalinaBlue.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.egyptianBlue,
              AppColors.royalBlue,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SlideAnimation(
                  delay: 600,
                  startOffset: const Offset(-2, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        day.day.condition.icon,
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        day.day.condition.text,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SlideAnimation(
                  delay: 600,
                  startOffset: const Offset(2, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day.day.avgTempC.toStringAsPrecision(2),
                            style: GoogleFonts.poppins(
                              fontSize: 76,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                          Text(
                            'º',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max temp ${day.day.maxTempC.toStringAsPrecision(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'º',
                            style: GoogleFonts.poppins(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min temp ${day.day.minTempC.toStringAsPrecision(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'º',
                            style: GoogleFonts.poppins(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 12),
                      // Image.asset(
                      //   'assets/images/weather.png',
                      //   width: 60,
                      //   height: 60,
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  mainAxisExtent: 64,
                ),
                children: [
                  SlideAnimation(
                    delay: 800,
                    startOffset: const Offset(-2, 0),
                    child: buildDetails(
                      icon: 'assets/images/wind_speed.png',
                      value: '${day.day.maxWindMph.toStringAsPrecision(2)} mph',
                      title: 'Wind',
                    ),
                  ),
                  SlideAnimation(
                    delay: 800,
                    startOffset: const Offset(2, 0),
                    child: buildDetails(
                      icon: 'assets/images/humidity.png',
                      value: '${day.day.avgHumidity.toStringAsPrecision(2)} %',
                      title: 'Humidity',
                    ),
                  ),
                  SlideAnimation(
                    delay: 1000,
                    startOffset: const Offset(-2, 0),
                    child: buildDetails(
                      icon: 'assets/images/sunrise.png',
                      value: day.astro.sunrise,
                      title: 'Sunrise',
                    ),
                  ),
                  SlideAnimation(
                    delay: 1000,
                    startOffset: const Offset(2, 0),
                    child: buildDetails(
                      icon: 'assets/images/sunset.png',
                      value: day.astro.sunset,
                      title: 'Sunset',
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     SlideAnimation(
            //       delay: 800,
            //       startOffset: const Offset(-2, 0),
            //       child: buildDetails(
            //         icon: 'assets/images/wind_speed.png',
            //         value: '${day.day.maxWindMph.toStringAsPrecision(2)} mph',
            //         title: 'Wind',
            //       ),
            //     ),
            //     const SizedBox(width: 8),
            //     SlideAnimation(
            //       delay: 800,
            //       startOffset: const Offset(2, 0),
            //       child: buildDetails(
            //         icon: 'assets/images/humidity.png',
            //         value: '${day.day.avgHumidity.toStringAsPrecision(2)} %',
            //         title: 'Humidity',
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // Row(
            //   children: [
            //     SlideAnimation(
            //       delay: 1000,
            //       startOffset: const Offset(-2, 0),
            //       child: buildDetails(
            //         icon: 'assets/images/sunrise.png',
            //         value: day.astro.sunrise,
            //         title: 'Sunrise',
            //       ),
            //     ),
            //     const SizedBox(width: 8),
            //     SlideAnimation(
            //       delay: 1000,
            //       startOffset: const Offset(2, 0),
            //       child: buildDetails(
            //         icon: 'assets/images/sunset.png',
            //         value: day.astro.sunset,
            //         title: 'Sunset',
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildDetails({
    required String icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
            color: Colors.white.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // const SizedBox(height: 4),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Image.asset(
    //       icon,
    //       width: 36,
    //       height: 36,
    //     ),
    //     const SizedBox(height: 4),
    //     Text(
    //       value,
    //       style: GoogleFonts.poppins(
    //         fontSize: 16,
    //         color: Colors.white,
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //     const SizedBox(height: 4),
    //     Text(
    //       title,
    //       style: GoogleFonts.poppins(
    //         fontSize: 12,
    //         color: Colors.white,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //   ],
    // );
  }
}
