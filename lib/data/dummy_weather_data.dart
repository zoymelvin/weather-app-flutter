import '../models/weather_model.dart';

final List<WeatherModel> dummyWeatherData = [
  WeatherModel(
    city: "Medan",
    temperature: 29,
    condition: "Berawan",
    icon: "☁️",
    humidity: 75,
    feelsLike: 30,
    windSpeed: 10,
    simpleDesc: "29°C · Berawan",
  ),
  
  WeatherModel(
    city: "Bandung",
    temperature: 24,
    condition: "Hujan Ringan",
    icon: "🌧️",
    humidity: 80,
    feelsLike: 25,
    windSpeed: 8,
    simpleDesc: "24°C · Hujan Ringan",
  ),
  
  WeatherModel(
    city: "Surabaya",
    temperature: 34,
    condition: "Panas Terik",
    icon: "☀️",
    humidity: 60,
    feelsLike: 36,
    windSpeed: 15,
    simpleDesc: "34°C · Panas Terik",
  ),
  
  WeatherModel(
    city: "Jakarta",
    temperature: 32,
    condition: "Cerah berawan",
    icon: "🌥️",
    humidity: 68,
    feelsLike: 34,
    windSpeed: 12,
    simpleDesc: "32°C · Cerah berawan",
  ),
  
  WeatherModel(
    city: "Denpasar",
    temperature: 31,
    condition: "Cerah",
    icon: "🌴",
    humidity: 70,
    feelsLike: 33,
    windSpeed: 14,
    simpleDesc: "31°C · Cerah",
  ),

  WeatherModel(
    city: "Yogyakarta",
    temperature: 28,
    condition: "Mendung",
    icon: "🌫️",
    humidity: 78,
    feelsLike: 29,
    windSpeed: 9,
    simpleDesc: "28°C · Mendung",
  ),
];