import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import '../widgets/city_tile.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  final TextEditingController _cityController = TextEditingController();
  Key _refreshKey = UniqueKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _refreshKey = UniqueKey());
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cityProvider = Provider.of<CityProvider>(context);

    // Check if data is still loading
    if (cityProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: 'Enter city name',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  cityProvider.addCity(_cityController.text);
                  _cityController.clear();
                },
              ),
            ),
            onSubmitted: (_) {
              cityProvider.addCity(_cityController.text);
              _cityController.clear();
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              key: _refreshKey,
              itemCount: cityProvider.cities.length,
              itemBuilder: (context, index) {
                final city = cityProvider.cities[index];
                return CityTile(city: city);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}