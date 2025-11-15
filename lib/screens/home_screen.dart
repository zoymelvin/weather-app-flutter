import 'package:flutter/material.dart';
import '../data/dummy_weather_data.dart';
import '../models/weather_model.dart';
import '../widgets/weather_card.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const double _kVerticalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    final WeatherModel mainWeather = dummyWeatherData.first;
    final List<WeatherModel> otherCities = dummyWeatherData.skip(1).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(_kVerticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: _kVerticalPadding),
              _LocationInfo(weather: mainWeather),
              const SizedBox(height: _kVerticalPadding),
              _CurrentWeatherCard(weather: mainWeather),
              const SizedBox(height: 24),
              const _SectionTitle(title: "Kota lain di Indonesia"),
              const SizedBox(height: 8),
              _OtherCitiesList(cities: otherCities),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _LocationInfo extends StatelessWidget {
  final WeatherModel weather;
  const _LocationInfo({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Lokasi",
                  style: TextStyle(fontSize: 11.2, color: AppColors.kTextSub),
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
}

class _CurrentWeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const _CurrentWeatherCard({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.4,
            fontWeight: FontWeight.w500,
            color: AppColors.kTextMain,
          ),
        ),
      ],
    );
  }
}

class _OtherCitiesList extends StatelessWidget {
  final List<WeatherModel> cities;
  const _OtherCitiesList({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return _buildListView(cities);
        } else {
          return _buildGridView(cities);
        }
      },
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
}
