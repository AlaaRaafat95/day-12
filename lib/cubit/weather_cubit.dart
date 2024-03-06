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
    }
    if (weatherModel?.condition == "Partly Cloudy" ||
        weatherModel?.condition == "Cloudy" ||
        weatherModel?.condition == "Mist" ||
        weatherModel?.condition == "Fog" ||
        weatherModel?.condition == "Freezing fog" ||
        weatherModel?.condition == "Overcast") {
      return Colors.blueGrey;
    }

    if (weatherModel?.condition == "Patchy rain possible" ||
        weatherModel?.condition == "Patchy light drizzle" ||
        weatherModel?.condition == "Blowing snow" ||
        weatherModel?.condition == "Blizzard" ||
        weatherModel?.condition == "Patchy light rain" ||
        weatherModel?.condition == "Light drizzle" ||
        weatherModel?.condition == "Light rain" ||
        weatherModel?.condition == "Moderate rain at times" ||
        weatherModel?.condition == "Moderate rain" ||
        weatherModel?.condition == "Heavy rain at times" ||
        weatherModel?.condition == "Heavy rain" ||
        weatherModel?.condition == "Light freezing rain" ||
        weatherModel?.condition == "Moderate or heavy freezing rain" ||
        weatherModel?.condition == "Light sleet" ||
        weatherModel?.condition == "Moderate or heavy sleet" ||
        weatherModel?.condition == "Patchy light snow" ||
        weatherModel?.condition == "Light snow" ||
        weatherModel?.condition == "Patchy moderate snow" ||
        weatherModel?.condition == "Moderate snow" ||
        weatherModel?.condition == "Patchy heavy snow" ||
        weatherModel?.condition == "Heavy snow" ||
        weatherModel?.condition == "Ice pellets" ||
        weatherModel?.condition == "Light rain shower" ||
        weatherModel?.condition == "Moderate or heavy rain shower" ||
        weatherModel?.condition == "Torrential rain shower" ||
        weatherModel?.condition == "Light sleet showers" ||
        weatherModel?.condition == "Moderate or heavy sleet showers" ||
        weatherModel?.condition == "Light snow showers" ||
        weatherModel?.condition == "Moderate or heavy snow showers" ||
        weatherModel?.condition == "Light showers of ice pellets" ||
        weatherModel?.condition == "Moderate or heavy showers of ice pellets" ||
        weatherModel?.condition == "Patchy light rain with thunder" ||
        weatherModel?.condition == "Moderate or heavy rain with thunder" ||
        weatherModel?.condition == "Patchy light snow with thunder" ||
        weatherModel?.condition == "Moderate or heavy snow with thunder") {
      return Colors.yellow;
    } else {
      return Colors.blue;
    }
  }
}
