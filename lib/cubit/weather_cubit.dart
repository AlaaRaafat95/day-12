import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_servies.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;

  Future<void> getWeather({required String cityName}) async {
    emit(
      WeatherLoading(),
    );
    try {
      weatherModel = await WeatherServices().getWeatherApi(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(
        WeatherFaliure(
          error: e.toString(),
        ),
      );
    }
  }

  MaterialColor getWeatherThemeColor() {
    if (weatherModel?.condition == "Sunny") {
      return Colors.orange;
    } else if (weatherModel!.condition!.contains("rain") ||
        weatherModel!.condition!.contains("snow") ||
        weatherModel!.condition!.contains("drizzle") ||
        weatherModel!.condition!.contains("sleet") ||
        weatherModel?.condition == "Blizzard" ||
        weatherModel!.condition!.toLowerCase().contains("ice pellets")) {
      return Colors.teal;
    } else if (weatherModel!.condition!.toLowerCase().contains("cloudy") ||
        weatherModel?.condition == "Mist" ||
        weatherModel!.condition!.toLowerCase().contains("fog") ||
        weatherModel!.condition!.toLowerCase().contains("overcast")) {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }
}
