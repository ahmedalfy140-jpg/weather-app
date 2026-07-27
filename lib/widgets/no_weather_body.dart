import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('There is no weather 😔 start', style: TextStyle(fontSize: 22)),
          Text('searching now 🔍', style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
