[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FSupriyaKuncha%2Fculturize&count_bg=%23FE5667&title_bg=%23FE5667&icon=github.svg&icon_color=%23FFFFFF&title=Repository+Visits&edge_flat=false)](https://hits.seeyoufarm.com)

  <h1 align="center"> WeatherApp </h1>
<p align="center">A <b>Weather App</b> made using Flutter and OpenWeatherAPI</p>

<p align="center">A simple weather app built with Flutter that displays current weather information for a given city. The app also fetches and displays a background image of the city.</p>

## 📝 Project Info
The contents in this project follow the following structure, where all views are containerised into screens.

```
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
├── pubspec.yaml
├── README.md
└── screenshots/
    ├── home_screen.png
    └── weather_details_screen.png
```

## ⚙️ Setup

  #### Tech Stack
  <ul>
  <li><img src="https://img.icons8.com/color/48/null/flutter.png" width="20" height="20">  Flutter</li>
  </ul>

  ##### Clone the repository
```bash
git clone https://github.com/HarshaVoleti/WeatherApp.git
```
  ##### Move to the desired folder
```bash
cd \WeatherApp
```

  ##### To run the app, simply write
```bash
flutter pub get
flutter run
```

## ℹ️ About

<p> A simple weather app built with Flutter and OpenWeatherAPI that displays current weather information for a given city. The app also fetches and displays a background image of the city.</p>

### Here is the quick tour on how to use our app
After installing our app.

#### <h3><ins>Home Screen.</ins></h3>
 User have to enter City name and hit Get Weather button.

<div display="flex" align="center" border-left="2px solid white">
<img src="[screenshot/homepage.png](https://github.com/HarshaVoleti/WeatherApp/blob/main/screenshots/homepage.png)" width="200" height="400" >
</div>

#### <h3><ins>Weather Screen.</ins></h3>
Here in this screen, you can see Current weather condition including temperature, humidity, wind speed, updated Time and also u can refresh to fetch the latest information.

<div display="flex" align="center" border-left="2px solid white">
<img src="https://github.com/HarshaVoleti/WeatherApp/blob/main/screenshots/NewYork.png" width="200" height="400" >
<img src="https://github.com/HarshaVoleti/WeatherApp/blob/main/screenshots/Paris.png" width="200" height="400" >
<img src="https://github.com/HarshaVoleti/WeatherApp/blob/main/screenshots/Dubai.png" width="200" height="400" >
</div>

🛠️ Built With
Flutter - The UI toolkit used to build the app.
Provider - State management solution.
OpenWeatherMap API - Weather data provider.
Unsplash API - City image provider.
💬 Contact
Harsha Voleti - mailharshavoleti@gmail.com
