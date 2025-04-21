import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_tab.dart';
import 'screens/forecast_tab.dart';
import 'providers/city_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (_) => CityProvider()..loadCitiesFromFirebase(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Tabs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Forecast'),
            ]),
          ),
          body: TabBarView(
            children: [
              HomeTab(),
              ForecastTab(),
            ],
          ),
        ),
      ),
    );
  }
}