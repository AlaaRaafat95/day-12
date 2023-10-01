import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : Colors.orange,
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
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
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.yellow],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.weatherModel.cityName,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Updated in : ${state.weatherModel.date.substring(0, 10)}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Updated at : ${state.weatherModel.date.substring(10)}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: NetworkImage(
                              scale: 0.6, "http:${state.weatherModel.icon}"),
                        ),
                        Text(state.weatherModel.aveTemp.toInt().toString(),
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Max Temp = ${state.weatherModel.maxTemp.toInt()}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                                "Min Temp = ${state.weatherModel.minTemp.toInt()}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(state.weatherModel.condition,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            );
          }
          if (state is WeatherFaliure) {
            return const Center(
              child: Text(
                "There is some problems 🤦‍♂️",
                style: TextStyle(fontSize: 25),
              ),
            );
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "there is no weather 😌",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Start searching now 🔍",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
