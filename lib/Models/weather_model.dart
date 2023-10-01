class WeatherModel {
  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.aveTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition,
      required this.icon});
  final String cityName;
  final String date;
  final double aveTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;

  factory WeatherModel.fromjason(Map<String, dynamic> data) {
    var jasonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
        cityName: data["location"]["name"],
        date: data["location"]["localtime"],
        aveTemp: jasonData["avgtemp_c"],
        maxTemp: jasonData["maxtemp_c"],
        minTemp: jasonData["mintemp_c"],
        condition: jasonData["condition"]["text"],
        icon: jasonData["condition"]["icon"]);
  }
}
