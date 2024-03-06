class WeatherModel {
  String? cityName;
  String? country;
  String? date;
  double? aveTemp;
  double? maxTemp;
  double? minTemp;
  String? condition;
  String? icon;
  WeatherModel();
  WeatherModel.fromjason(Map<String, dynamic> data) {
    var jasonData = data["forecast"]["forecastday"][0]["day"];

    cityName = data["location"]["name"];
    country = data["location"]["country"];
    date = data["location"]["localtime"];
    aveTemp = jasonData["avgtemp_c"];
    maxTemp = jasonData["maxtemp_c"];
    minTemp = jasonData["mintemp_c"];
    condition = jasonData["condition"]["text"];
    icon = jasonData["condition"]["icon"];
  }
}
