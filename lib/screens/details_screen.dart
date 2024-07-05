import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_info.dart';

class WeatherDetailsScreen extends StatelessWidget {
  WeatherDetailsScreen({required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<WeatherProvider>(context, listen: false).fetchWeather(
                Provider.of<WeatherProvider>(context, listen: false)
                    .weather!
                    .cityName,
              );
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            if (weatherProvider.loading) {
              return Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            } else if (weatherProvider.error != null) {
              return Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.9),
                child: Text(
                  weatherProvider.error!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              );
            } else if (weatherProvider.weather != null) {
              final weather = weatherProvider.weather!;
              return Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.9),
                child: WeatherInfo(
                  weather: weatherProvider.weather!,
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.9),
                child: Text(
                  'Enter a city name to get weather information.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
