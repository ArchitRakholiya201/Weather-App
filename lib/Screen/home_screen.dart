import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/current_weather_details.dart';
import 'package:weather_app/widgets/hours_forecaset.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeScreenProvider).fetchTodayForecast();
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeScreenProvider);
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.egyptianBlue,
                AppColors.royalBlue,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: provider.isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CurrentWeatherDetails(),
                      SizedBox(height: 28),
                      HoursForecast(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
