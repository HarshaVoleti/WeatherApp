import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather App'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Weather',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  children: [
                    TextSpan(
                      text: 'App',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  _controller.text.length != 0 || _controller.text.isNotEmpty
                      ? {
                          Provider.of<WeatherProvider>(context, listen: false)
                              .fetchWeather(_controller.text),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherDetailsScreen(
                                cityName: _controller.text,
                              ),
                            ),
                          ),
                        }
                      : {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a city name'),
                            ),
                          ),
                        };
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  child: Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
