import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import '../models/weather.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  WeatherInfo({required this.weather});

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<WeatherProvider>(context, listen: false).time;
    final size = MediaQuery.of(context).size;
    final appbarSize = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        weather.cityImageUrl.isNotEmpty
            ? Image.network(
                weather.cityImageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,
              )
            : Container(),
        Container(
          padding: EdgeInsets.only(
            top: appbarSize + 20,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                weather.cityName,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                ' Updated as of ${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}:${time.second}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Image.network(
                'http://openweathermap.org/img/wn/${weather.icon}@2x.png',
                // height: size.height * 0.10,
                fit: BoxFit.cover,
              ),
              Text(
                weather.condition,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Min Temp',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '${weather.temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        'Max Temp',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '${weather.temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Humidity',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${weather.humidity.toStringAsFixed(1)}%',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Icon(
                          Icons.air_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Wind',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${weather.windSpeed.toStringAsFixed(1)}km/h',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Icon(
                          Icons.thermostat_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Feels Like',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${weather.temperature.toStringAsFixed(1)}°C',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
