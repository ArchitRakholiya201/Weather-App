import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/slide_animation.dart';

class CurrentWeatherDetails extends StatefulWidget {
  const CurrentWeatherDetails({super.key});

  @override
  State<CurrentWeatherDetails> createState() => _CurrentWeatherDetailsState();
}

class _CurrentWeatherDetailsState extends State<CurrentWeatherDetails> {
  Color containerColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(const Duration(milliseconds: 400));
        setState(() => containerColor = AppColors.catalinaBlue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final provider = ref.watch(homeScreenProvider);
      final location = provider.forecastData!.location;
      final currentWeather = provider.forecastData!.current;
      return Column(
        children: [
          SlideAnimation(
            delay: 200,
            duration: 800,
            startOffset: const Offset(0, -5),
            child: Text(
              location.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          SlideAnimation(
            startOffset: const Offset(0, -7),
            duration: 800,
            child: Text(
              currentWeather.condition.text,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SlideAnimation(
                duration: 1200,
                startOffset: const Offset(-4, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.7),
                            ],
                          ).createShader(
                            Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                          );
                        },
                        child: Text(
                          currentWeather.tempC.toStringAsPrecision(2),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.2),
                          ],
                        ).createShader(
                          Rect.fromLTRB(
                            0,
                            0,
                            bounds.width,
                            bounds.height,
                          ),
                        );
                      },
                      child: Text(
                        'º',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 80,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SlideAnimation(
                delay: 200,
                duration: 1200,
                startOffset: const Offset(4, 0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 88.0, left: 40),
                  child: Image.asset(
                    currentWeather.condition.icon,
                    // semanticsLabel: 'Acme Logo',
                    width: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: containerColor,
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
                ]),
            curve: Curves.ease,
            duration: const Duration(milliseconds: 2000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SlideAnimation(
                  delay: 800,
                  startOffset: const Offset(-4, 0),
                  child: buildDetails(
                    icon: 'assets/images/wind_speed.png',
                    value:
                        '${currentWeather.windMph.toStringAsPrecision(2)} mph',
                    title: 'Wind',
                  ),
                ),
                SlideAnimation(
                  delay: 400,
                  startOffset: const Offset(-6, 0),
                  child: buildDetails(
                    icon: 'assets/images/humidity.png',
                    value:
                        '${currentWeather.humidity.toStringAsPrecision(2)} %',
                    title: 'Humidity',
                  ),
                ),
                SlideAnimation(
                  delay: 600,
                  startOffset: const Offset(4, 0),
                  child: buildDetails(
                    icon: 'assets/images/pressure.png',
                    value:
                        '${currentWeather.pressureIn.toStringAsPrecision(2)} in',
                    title: 'Pressure',
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget buildDetails({
    required String icon,
    required String title,
    required String value,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          width: 36,
          height: 36,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
