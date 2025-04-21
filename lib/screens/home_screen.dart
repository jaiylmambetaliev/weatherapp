// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/city_provider.dart';
// import 'forecast_screen.dart';
//
// class HomeScreen extends StatelessWidget {
//   final TextEditingController _cityController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final cityProvider = Provider.of<CityProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Cities')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: _cityController,
//               decoration: InputDecoration(
//                 labelText: 'Enter city name',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     cityProvider.addCity(_cityController.text);
//                     _cityController.clear();
//                   },
//                 ),
//               ),
//               onSubmitted: (_) {
//                 cityProvider.addCity(_cityController.text);
//                 _cityController.clear();
//               },
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cityProvider.cities.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text(cityProvider.cities[index]),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => cityProvider.removeCity(cityProvider.cities[index]),
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: cityProvider.cities.isEmpty
//                   ? null
//                   : () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => ForecastScreen()),
//               ),
//               child: Text('View Forecasts'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }