// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubit/get_weather_cubit/get_weaher_states.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';

// class GetWeatherCubit extends Cubit<WeatherState> {
//   GetWeatherCubit() : super(InitialState());
//   WeatherModel? weatherModel;

//   Future<void> getWeather({required String cityName}) async {
//     try {
//       weatherModel = await WeatherService(
//         Dio(),
//       ).getCurrentWeather(cityName: cityName);
//       emit(WeatherLoadedState(weatherModel!));
//     } catch (e) {
//       emit(WeatherFailureState());
//     }
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService):super (WeatherInitialState());

  WeatherService weatherService ;
  WeatherModel? weatherModel;

  Future<void> getWeather ({required String cityName})async{
    emit(WeatherLoadedState());
   try {
   weatherModel= await weatherService.getCurrentWeather(cityName: cityName);
    emit(WeatherSuccessState(weatherModel: weatherModel!));
} on Exception catch (e) {

emit(WeatherFailureState());
}
  


    
  }


  
}