part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {}

class WeatherFaliure extends WeatherState {
  String error;
  WeatherFaliure({
    required this.error,
  });
}
