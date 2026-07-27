import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City '),
        backgroundColor:
            BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
            ? Colors.amber
            : getThemeColor(
                BlocProvider.of<GetWeatherCubit>(
                  context,
                ).weatherModel?.weatherCondition,
              ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
              // log(weatherModel.cityName);
            },
            autofocus: true,
            // textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: 'Search',
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),

              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              // ),
              hintText: 'Search City Name.....',
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search),
              ),
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
