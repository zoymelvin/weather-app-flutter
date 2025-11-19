import 'package:flutter/material.dart';
import 'package:weather_app_joymelvin/screens/detail_screen.dart';
import '../models/weather_model.dart';
import '../utils/app_colors.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              weather: weather,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather.city,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kTextMain,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    weather.simpleDesc,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: AppColors.kTextSub,
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${weather.temperature}°',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kTagText,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    weather.icon,
                    style: const TextStyle(fontSize: 25.6),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}