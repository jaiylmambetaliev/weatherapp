import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherFullScreen extends StatelessWidget {
  final String city;

  const WeatherFullScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: WeatherService().fetchWeather(city),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading weather for $city'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data for $city'));
        }

        final weather = snapshot.data!;
        return Container(
          color: Colors.lightBlue[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(city.toUpperCase(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                Text('${weather.temperature}°C', style: TextStyle(fontSize: 48)),
                Text(weather.description, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      },
    );
  }
}