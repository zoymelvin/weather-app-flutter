class WeatherModel {
  final String city;
  final int temperature;
  final String condition;
  final String icon;

  final int humidity;
  final int feelsLike;
  final int windSpeed;
  final String simpleDesc;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.feelsLike,
    required this.windSpeed,
    required this.simpleDesc,
  });
}