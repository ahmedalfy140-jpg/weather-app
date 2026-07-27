import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(
                    context,
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

// MaterialColor getThemeColor(String? condition) {
//   // 1. Safe Fallback: Handle null values gracefully
//   if (condition == null) {
//     return Colors.amber;
//   }

//   // 2. Normalize: Remove accidental spaces and keep casing consistent
//   //final cleanCondition = condition.trim();

//   switch (condition) {
//     // Orange/Amber for bright, clear days
//     case 'Sunny':
//       return Colors.orange;
//     case 'Clear':
//       return Colors.amber;

//     // BlueGrey/Grey for clouds, mist, and heavy fog
//     case 'Partly cloudy':
//     case 'Cloudy':
//     case 'Overcast':
//     case 'Mist':
//     case 'Fog':
//     case 'Freezing fog':
//       return Colors.blueGrey;

//     // Blue for all variations of rain and drizzle
//     case 'Patchy rain possible':
//     case 'Patchy freezing drizzle possible':
//     case 'Patchy light drizzle':
//     case 'Light drizzle':
//     case 'Freezing drizzle':
//     case 'Heavy freezing drizzle':
//     case 'Patchy light rain':
//     case 'Light rain':
//     case 'Moderate rain at times':
//     case 'Moderate rain':
//     case 'Heavy rain at times':
//     case 'Heavy rain':
//     case 'Light freezing rain':
//     case 'Moderate or heavy freezing rain':
//     case 'Light rain shower':
//     case 'Moderate or heavy rain shower':
//     case 'Torrential rain shower':
//       return Colors.blue;

//     // Purple for thunderstorms
//     case 'Thundery outbreaks possible':
//     case 'Patchy light rain with thunder':
//     case 'Moderate or heavy rain with thunder':
//     case 'Patchy light snow with thunder':
//     case 'Moderate or heavy snow with thunder':
//       return Colors.deepPurple;

//     // Cyan/Teal for ice, snow, winter storms, and sleet
//     case 'Patchy snow possible':
//     case 'Patchy sleet possible':
//     case 'Blowing snow':
//     case 'Blizzard':
//     case 'Light sleet':
//     case 'Moderate or heavy sleet':
//     case 'Patchy light snow':
//     case 'Light snow':
//     case 'Patchy moderate snow':
//     case 'Moderate snow':
//     case 'Patchy heavy snow':
//     case 'Heavy snow':
//     case 'Ice pellets':
//     case 'Light sleet showers':
//     case 'Moderate or heavy sleet showers':
//     case 'Light snow showers':
//     case 'Moderate or heavy snow showers':
//     case 'Light showers of ice pellets':
//     case 'Moderate or heavy showers of ice pellets':
//       return Colors.cyan;

//     // 3. Absolute Fallback: If the API sends something completely unexpected
//     default:
//       return Colors.blue;
//   }
// }
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
