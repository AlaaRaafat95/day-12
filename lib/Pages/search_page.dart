import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: TextField(
              onSubmitted: (data) async {
                await BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: data);

                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                suffixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Enter city name",
                label: Text(
                  "Search",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
