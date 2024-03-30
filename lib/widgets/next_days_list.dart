import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/providers/home_screen_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/widgets/slide_animation.dart';

class NextDaysList extends ConsumerStatefulWidget {
  const NextDaysList({super.key});

  @override
  ConsumerState<NextDaysList> createState() => _NextDaysListState();
}

class _NextDaysListState extends ConsumerState<NextDaysList> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeScreenProvider);
    final days = provider.forecastData!.foreCast.forecastDay.toList();
    return SizedBox(
      height: 190,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: provider.daysScrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            for (int i = 0; i < days.length; i++)
              SlideAnimation(
                startOffset: const Offset(7, 0),
                duration: 600,
                delay: 200 * i,
                child: buildDay(days[i]),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildDay(ForecastDay day) {
    var provider = ref.read(homeScreenProvider);
    final isToday = provider.selectedDay == day.date.day;
    return GestureDetector(
      onTap: () => provider.selectedDay = day.date.day,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isToday ? AppColors.babyBlue : Colors.white,
          gradient: isToday
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.cetaceanBlue,
                    AppColors.catalinaBlue,
                  ],
                )
              : null,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              width: isToday ? 60 : 40,
              height: isToday ? 60 : 40,
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    day.day.condition.icon,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image.asset(
            //   day.day.condition.icon,
            //   width: isToday ? 60 : 40,
            //   height: isToday ? 60 : 40,
            // ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              style: GoogleFonts.poppins(
                fontSize: isToday ? 24 : 16,
                fontWeight: FontWeight.w600,
                color: isToday ? Colors.white : AppColors.catalinaBlue,
              ),
              duration: const Duration(milliseconds: 600),
              child: Text(
                DateFormat('dd').format(day.date),
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              style: GoogleFonts.poppins(
                fontSize: isToday ? 24 : 16,
                fontWeight: FontWeight.w600,
                color: isToday ? Colors.white : AppColors.catalinaBlue,
              ),
              duration: const Duration(milliseconds: 600),
              child: Text(
                DateFormat('EEE').format(day.date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
