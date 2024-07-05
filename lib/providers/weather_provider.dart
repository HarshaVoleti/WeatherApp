import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_services.dart';
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _loading = false;
  String? _error;
  DateTime time = DateTime.now();
  List<String> _citySuggestions = [];
  List<String> _famousCities = [
    'Mumbai',
    'Hyderabad',
    'Chennai',
    'Bangalore',
    'Visakhapatnam'
  ];

  Weather? get weather => _weather;
  bool get loading => _loading;
  String? get error => _error;
  List<String> get citySuggestions => _citySuggestions;
  List<String> get famousCities => _famousCities;
  DateTime? get lastUpdated => time;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await WeatherService().fetchWeather(cityName);
      time = DateTime.now();
      // final cityImageUrl = await WeatherService().fetchCityImage(cityName);
      // _weather = _weather!.copyWith(cityImageUrl: cityImageUrl);
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> fetchCitySuggestions(String query) async {
    try {
      _citySuggestions = await WeatherService().fetchCitySuggestions(query);
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  void addFamousCity(String cityName) {
    if (!_famousCities.contains(cityName)) {
      _famousCities.add(cityName);
      notifyListeners();
    }
  }
}
