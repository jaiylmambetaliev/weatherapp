import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import '../widgets/weather_fullscreen.dart';

class ForecastTab extends StatefulWidget {
  @override
  _ForecastTabState createState() => _ForecastTabState();
}

class _ForecastTabState extends State<ForecastTab> {
  PageController _controller = PageController();
  int _page = 0;

  void _goTo(int index, int max) {
    if (index >= 0 && index < max) {
      _controller.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cityProvider = context.watch<CityProvider>();

    if (cityProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    final cities = cityProvider.cities;

    if (cities.isEmpty) {
      return Center(child: Text('No cities added'));
    }

    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: cities.length,
          onPageChanged: (i) => setState(() => _page = i),
          itemBuilder: (ctx, i) => WeatherFullScreen(city: cities[i]),
        ),
        if (cities.length > 1 && _page > 0)
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => _goTo(_page - 1, cities.length),
            ),
          ),
        if (cities.length > 1 && _page < cities.length - 1)
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () => _goTo(_page + 1, cities.length),
            ),
          ),
      ],
    );
  }
}