import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherServices {
  Dio dio = Dio();
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "3e1c7d9507d84019901201954231005";

  Future<WeatherModel> getWeatherApi({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromjason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMsg = e.response?.data["error"]["message"];
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("there was an error ,try later");
    }
  }
}
