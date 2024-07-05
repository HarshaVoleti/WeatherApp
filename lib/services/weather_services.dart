import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather.dart';

class WeatherService {
  static const String _apiKey = '2c76b7f227e7b35ab41e52a63ddcbeb3';
  static const String unsplashApiKey =
      'AnvSLWG4P5BsYzCIxrkwcjwG3ssnoPiaoEDQ0Y0msWE';
  static const String _weatherBaseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String _oneCallBaseUrl =
      'https://api.openweathermap.org/data/2.5/onecall';
  static const String _geocodingBaseUrl =
      'https://api.openweathermap.org/geo/1.0/direct';
  static const String _unsplashBaseUrl =
      'https://api.unsplash.com/search/photos';

  Future<Weather> fetchWeather(String cityName) async {
    try {
      final weatherResponse = await http
          .get(Uri.parse('$_weatherBaseUrl?q=$cityName&appid=$_apiKey'));
      print(" weather response is  $weatherResponse");
      print("status code is ${weatherResponse.statusCode}");
      if (weatherResponse.statusCode == 200) {
        print("body is  ${weatherResponse.body}");
        final weatherJson = jsonDecode(weatherResponse.body);
        double lat = weatherJson['coord']['lat'];
        print("lat is $lat");
        double lon = weatherJson['coord']['lon'];
        print("lon is $lon");
        final image = await fetchCityImage(cityName);
        print("image is $image");
        return Weather.fromJson(weatherJson, image);

        // final oneCallResponse = await http.get(
        //     Uri.parse('$_oneCallBaseUrl?lat=$lat&lon=$lon&appid=$_apiKey'));
        // print(
        //     "one call response status code  is  ${oneCallResponse.statusCode}");
        // // if (oneCallResponse.statusCode == 200 && image.isNotEmpty) {
        // //   print("one call response is  ${oneCallResponse.body}");
        // //   final oneCallJson = jsonDecode(oneCallResponse.body);
        // //   return Weather.fromJson(weatherJson, oneCallJson, image);
        // // } else {
        // //   throw Exception('Failed to load one call weather data');
        // // }
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception(' $e Failed to load weather data');
    }
  }

  Future<List<String>> fetchCitySuggestions(String query) async {
    final response = await http
        .get(Uri.parse('$_geocodingBaseUrl?q=$query&limit=5&appid=$_apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((city) => city['name'] as String).toList();
    } else {
      throw Exception('Failed to load city suggestions');
    }
  }

  Future<String> fetchCityImage(String cityName) async {
    final response = await http.get(Uri.parse(
        '$_unsplashBaseUrl?query=$cityName&client_id=$unsplashApiKey'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['results'].isNotEmpty) {
        return json['results'][0]['urls']['regular'];
      }
    }
    return '';
  }
}
