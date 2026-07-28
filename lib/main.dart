import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService(Dio())),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<WeatherCubit>(
                    context
                  ).weatherModel?.weatherCondition,
                ),
              ),

              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  // 1. Safe Fallback
  if (condition == null) {
    return Colors.amber;
  }

  // 2. Normalize to lowercase and remove spaces
  final cleanCondition = condition.trim().toLowerCase();

  // 3. Print to your debug console so you can see exactly what's failing!
  print('DEBUG: The exact API condition is: "$cleanCondition"');

  // 4. Group matches by keywords using .contains()
  if (cleanCondition.contains('sunny')) {
    return Colors.orange;
  }

  if (cleanCondition.contains('clear')) {
    return Colors.amber;
  }

  if (cleanCondition.contains('cloudy') ||
      cleanCondition.contains('overcast') ||
      cleanCondition.contains('mist') ||
      cleanCondition.contains('fog')) {
    return Colors.blueGrey;
  }

  if (cleanCondition.contains('rain') ||
      cleanCondition.contains('drizzle') ||
      cleanCondition.contains('shower')) {
    return Colors.blue;
  }

  if (cleanCondition.contains('thunder')) {
    return Colors.deepPurple;
  }

  if (cleanCondition.contains('snow') ||
      cleanCondition.contains('sleet') ||
      cleanCondition.contains('blizzard') ||
      cleanCondition.contains('ice')) {
    return Colors.cyan;
  }

  // 5. Fallback if the phrase is completely unique
  return Colors.amber;
}
