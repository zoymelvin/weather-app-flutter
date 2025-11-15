import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFe5e7eb),
                  ),
                ),
                SizedBox(height: 2), 
                Text(
                  weather.simpleDesc,
                  style: TextStyle(
                    
                    fontSize: 12.5,
                    color: const Color(0xFF9ca3af),
                  ),
                ),
              ],
            ),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${weather.temperature}°',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFbfdbfe),
                  ),
                ),
                SizedBox(width: 10),     
                Text(
                  weather.icon,
                  style: TextStyle(fontSize: 25.6),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}