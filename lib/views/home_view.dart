import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/wether_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.amber
            : getThemeColor(
                BlocProvider.of<WeatherCubit>(
                  context,
                ).weatherModel?.weatherCondition,
              ),
        title: Text('WeatherApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigates to the SearchScreen widget
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WetherInfoBody(weatherModel: state.weatherModel);
          } else if (state is WeatherFailureState){
            return Text('opps there was an error ');
          }else {
            return
            NoWeatherBody();
          }
        },
      ),
    );
  }
}
