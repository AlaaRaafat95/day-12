import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/Pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor:
                  BlocProvider.of<WeatherCubit>(context, listen: true)
                      .getWeatherThemeColor(),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: BlocProvider.of<WeatherCubit>(context, listen: true)
                  .getWeatherThemeColor(),
            ),
          ),
          title: 'Weather App',
          home: const HomePage(),
        );
      }),
    );
  }
}
