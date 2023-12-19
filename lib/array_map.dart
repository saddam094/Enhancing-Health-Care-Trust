import 'package:flutter/material.dart';

class ArrayToMap extends StatelessWidget {
  const ArrayToMap({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> countriesData = [
      {"country": "India", "capital": "New Delhi"},
      {"country": "USA", "capital": "Washington, D.C."},
      {"country": "Canada", "capital": "Ottawa"},
      {"country": "Germany", "capital": "Berlin"},
      {"country": "France", "capital": "Paris"},
      {"country": "Japan", "capital": "Tokyo"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Array to map'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: countriesData.map((e) {
          final String? country = e['country'];
          final String? capital = e['capital'];

          return ListTile(
            title: Text(country!),
            subtitle: Text('Capital: $capital'),
          );
        }).toList(),
      ),
    );
  }
}

