import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import '../widgets/weather_fullscreen.dart';

// class ForecastScreen extends StatefulWidget {
//   @override
//   _ForecastScreenState createState() => _ForecastScreenState();
// }
//
// class _ForecastScreenState extends State<ForecastScreen> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   void _goToPage(int index, int max) {
//     if (index >= 0 && index < max) {
//       _pageController.animateToPage(
//         index,
//         duration: Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cities = context.watch<CityProvider>().cities;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: cities.length,
//             onPageChanged: (index) => setState(() => _currentPage = index),
//             itemBuilder: (context, index) => WeatherFullScreen(city: cities[index]),
//           ),
//           if (cities.length > 1)
//             Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios, size: 32),
//                 onPressed: () => _goToPage(_currentPage - 1, cities.length),
//               ),
//             ),
//           if (cities.length > 1)
//             Align(
//               alignment: Alignment.centerRight,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_forward_ios, size: 32),
//                 onPressed: () => _goToPage(_currentPage + 1, cities.length),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }