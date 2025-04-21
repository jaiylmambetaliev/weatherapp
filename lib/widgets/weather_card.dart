// import 'package:flutter/material.dart';
// import '../models/weather_model.dart';
//
// class WeatherCard extends StatelessWidget {
//   final Weather weather;
//
//   const WeatherCard({required this.weather});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 6,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text(weather.city, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
//             Text('${weather.temperature}°C', style: TextStyle(fontSize: 36)),
//             Text(weather.description, style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }