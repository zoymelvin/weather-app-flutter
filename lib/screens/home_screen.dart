import 'package:flutter/material.dart';
import '../data/dummy_weather_data.dart';
import '../models/weather_model.dart';
import '../widgets/weather_card.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherModel mainWeather = dummyWeatherData.first;
    final List<WeatherModel> otherCities = dummyWeatherData.skip(1).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [            
            _buildHeader(),
            const SizedBox(height: 10),

            _buildLocationRow(mainWeather),
            const SizedBox(height: 14),

            _buildCurrentCard(mainWeather),
            const SizedBox(height: 16),

            _buildSectionTitle(),
            const SizedBox(height: 6),

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= 600) {
                  return _buildListView(otherCities); 
                } else {
                  return _buildGridView(otherCities); 
                }
              },
            ),
            
            const SizedBox(height: 10),

            _buildFooter(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weather App",
              style: TextStyle(
                fontSize: 17.5,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.03 * 16.8,
                color: AppColors.kTextMain,
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ],
    );
  }

  
  Widget _buildLocationRow(WeatherModel weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("📍", style: TextStyle(fontSize: 16)),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lokasi :",
                  style: TextStyle(fontSize: 13, color: AppColors.kTextSub),
                ),
                Text(
                  "${weather.city}, Indonesia",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kTextMain),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrentCard(WeatherModel weather) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kCardBlueSolid,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.city.toUpperCase(),
                style: TextStyle(
                  fontSize: 12.8,
                  letterSpacing: 0.12 * 12.8,
                  color: AppColors.kTextMain.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 3),
              Text(
                "${weather.temperature}°C",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "${weather.condition} · Kelembaban ${weather.humidity}%",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.95),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Terasa seperti ${weather.feelsLike}°C · Angin ${weather.windSpeed} km/jam",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
          Text(
            weather.icon,
            style: TextStyle(fontSize: 48),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Kota lain di Indonesia",
          style: TextStyle(
            fontSize: 14.4,
            fontWeight: FontWeight.w500,
            color: AppColors.kTextMain,
          ),
        ),
        Text(
          "Data Cuaca     ",
          style: TextStyle(
            fontSize: 11.2,
            color: AppColors.kTextFooter,
          ),
        ),
      ],
    );
  }

  Widget _buildListView(List<WeatherModel> cities) {
    return ListView.builder(
      itemCount: cities.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: WeatherCard(weather: cities[index]),
        );
      },
    );
  }

  Widget _buildGridView(List<WeatherModel> cities) {
    return GridView.builder(
      itemCount: cities.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 1.8,
      ),
      itemBuilder: (context, index) {
        return WeatherCard(weather: cities[index]);
      },
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Text(
        "Data cuaca dibuat statis untuk tugas",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.8,
          color: AppColors.kTextFooter,
        ),
      ),
    );
  }
}