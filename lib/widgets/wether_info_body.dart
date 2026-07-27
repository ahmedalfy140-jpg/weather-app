import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WetherInfoBody extends StatelessWidget {
  const WetherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      // 1. Clean the URL (removes spaces and adds https:)
                      'https:${weatherModel.image}',

                      // 2. Handle loading states (Optional but looks nice)
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      },

                      // 3. CATCH THE ERROR HERE
                      errorBuilder: (context, error, stackTrace) {
                        // This runs if the URL is broken, if there is no internet, or if the host is missing
                        return const Icon(
                          Icons.cloud_off,
                          size: 64,
                          color: Colors.grey,
                        );
                      },
                    ),
                    //   Image.network("https:${weatherModel.image}"),
                    // Image.asset('assets/images/clear.png'),
                    Text(
                      weatherModel.temp.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Column(
                      children: [
                        Text('MaxTemp: ${weatherModel.maxTemp.toString()}'),
                        Text('MinTemp: ${weatherModel.minTemp.toString()}'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
