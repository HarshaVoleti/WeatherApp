WeatherApp
A simple weather app built with Flutter that displays current weather information, tomorrow's forecast, and yesterday's weather for a given city. The app also fetches and displays a background image of the city.

Features
Search for a city's weather using the search bar.
Display current weather, tomorrow's forecast, and yesterday's weather.
Show an icon representing the current weather condition.
Display additional weather details like humidity and wind speed.
Show a background image of the city.
Include a list of famous cities for quick access.
Implement data persistence to save the last searched city.
Screenshots
Home Screen
<img src="screenshots/home_screen.png" alt="Home Screen" width="300"/>
Weather Details Screen
<img src="screenshots/weather_details_screen.png" alt="Weather Details Screen" width="300"/>
Getting Started
Prerequisites
Flutter installed on your machine.

Installation
Clone the repository:

sh
Copy code
git clone https://github.com/yourusername/weatherapp.git
cd weatherapp
Install dependencies:

sh
Copy code
flutter pub get

Run the app:

sh
Copy code
flutter run
Project Structure
plaintext
Copy code
weatherapp/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   └── weather.dart
│   ├── providers/
│   │   └── weather_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── weather_details_screen.dart
│   ├── services/
│   │   └── weather_service.dart
│   ├── widgets/
│   │   └── weather_info.dart
│   ├── main.dart
├── .env
├── pubspec.yaml
├── README.md
└── screenshots/
    ├── home_screen.png
    └── weather_details_screen.png
Usage
Home Screen: Enter a city name in the search bar and press the "Get Weather" button to see the weather details. You can also tap on a famous city to view its weather information.
Weather Details Screen: View the current weather, tomorrow's forecast, and yesterday's weather. The screen also shows an image of the city in the background.

Built With
Flutter - The UI toolkit used to build the app.
Provider - State management solution.
OpenWeatherMap API - Weather data provider.
Unsplash API - City image provider.

Contact
Your Name - your.email@example.com
