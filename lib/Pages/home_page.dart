import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/empty_weather.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/widgets/weather_info.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather Info"),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherSuccess) {
              return const WeatherInfo();
            }
            if (state is WeatherFaliure) {
              return const Center(
                child: Text(
                  "Please, enter the correct city name 🤦‍♂️",
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            return const EmptyWeather();
          },
        ),
      ),
    );
  }
}
