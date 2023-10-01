import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_servies.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  WeatherModel? weatherModel;

  void getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      weatherModel = await WeatherServices().getWeatherApi(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(
        WeatherFaliure(
          error: e.toString(),
        ),
      );
    }
  }
}
