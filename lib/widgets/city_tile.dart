import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';
import '../providers/city_provider.dart';

class CityTile extends StatelessWidget {
  final String city;

  const CityTile({required this.city});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: WeatherService().fetchWeather(city),
      builder: (context, snapshot) {
        Widget trailing;

        if (snapshot.connectionState == ConnectionState.waiting) {
          trailing = SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          trailing = Icon(Icons.error_outline, color: Colors.red);
        } else {
          final temp = snapshot.data!.temperature.toInt();
          trailing = Text('$temp°C', style: TextStyle(fontSize: 16));
        }

        return ListTile(
          title: Text(city),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              trailing,
              SizedBox(width: 12),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () =>
                    context.read<CityProvider>().removeCity(city),
              ),
            ],
          ),
        );
      },
    );
  }
}