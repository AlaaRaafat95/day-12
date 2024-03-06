import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<WeatherCubit>(context).weatherModel ?? WeatherModel();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        BlocProvider.of<WeatherCubit>(context).getWeatherThemeColor(),
        BlocProvider.of<WeatherCubit>(context).getWeatherThemeColor()[200]!
      ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Locate in : ${weatherModel.country}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Updated in : ${weatherModel.date!.substring(0, 10)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Updated at : ${weatherModel.date!.substring(10)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: NetworkImage(scale: 0.6, "http:${weatherModel.icon}"),
                ),
                Text(
                  weatherModel.aveTemp!.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Max Temp = ${weatherModel.maxTemp!.toInt()}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(
                      "Min Temp = ${weatherModel.minTemp!.toInt()}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              weatherModel.condition!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
