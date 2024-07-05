class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String icon;
  final int humidity;
  final double windSpeed;
  final String desctiprion;
  // final double temperatureTomorrow;
  // final double temperatureYesterday;
  final String cityImageUrl;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.desctiprion,
    // required this.temperatureTomorrow,
    // required this.temperatureYesterday,
    required this.cityImageUrl,
  });

  factory Weather.fromJson(Map<String, dynamic> weatherJson, String image) {
    final currentWeather = weatherJson['main'];
    // final forecastWeather = oneCallJson['daily'];
    // final historicalWeather =
    //     oneCallJson['daily'][0]; // Assuming historical data is available

    return Weather(
      cityName: weatherJson['name'],
      temperature:
          currentWeather['temp'] - 273.15, // Convert from Kelvin to Celsius
      condition: weatherJson['weather'][0]['description'],
      icon: weatherJson['weather'][0]['icon'],
      humidity: currentWeather['humidity'],
      windSpeed: weatherJson['wind']['speed'],
      desctiprion: weatherJson['weather'][0]['description'],
      // temperatureTomorrow: forecastWeather[1]['temp']['day'] - 273.15,
      // temperatureYesterday: historicalWeather['temp']['day'] - 273.15,
      cityImageUrl: image,
    );
  }
}
