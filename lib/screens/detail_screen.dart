import 'package:flutter/material.dart';
import 'package:weather_app_joymelvin/models/weather_model.dart';
import 'package:weather_app_joymelvin/utils/app_colors.dart';

class DetailScreen extends StatelessWidget {
  final WeatherModel weather;

  const DetailScreen({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        title: Text(weather.city),
        backgroundColor: const Color(0xFF0f172a),
        foregroundColor: AppColors.kTextMain,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1d4ed8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.city.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12.8,
                            letterSpacing: 0.12 * 12.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFe5f2ff),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "${weather.temperature}°C",
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                "${weather.condition} · Kelembaban ${weather.humidity}%",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.95),
                ),
              ),
                        const SizedBox(height: 4),
                        Text(
                "Terasa seperti ${weather.feelsLike}°C · Angin ${weather.windSpeed} km/jam",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    weather.icon,
                    style: const TextStyle(
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Ringkasan hari ini",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.kTextMain,
              ),
            ),
            const SizedBox(height: 8),

           GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.1,
            children: [
                _buildInfoCard("Kelembapan", "${weather.humidity}", "%"),
                _buildInfoCard("Kecepatan angin", "${weather.windSpeed}", "km/jam"),
                _buildInfoCard("Suhu minimum", "${weather.minTemp}", "°C"),
                _buildInfoCard("Suhu maksimum", "${weather.maxTemp}", "°C"),
                _buildInfoCard("UV Index", weather.uvIndex, ""),
                _buildInfoCard("Peluang hujan", "${weather.rainChance}", "%"),
            ],
           ),

            const SizedBox(height: 16),
            const Text(
              "Informasi di atas menggambarkan kondisi rata-rata hari ini",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.kTextSub,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInfoCard(String label, String value, String unit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0f172a),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 13,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (unit.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                  child: Text(
                    unit,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }