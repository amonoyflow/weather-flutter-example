import 'dart:convert';
import 'dart:io';
import 'package:city_weather/constant/keys.dart';
import 'package:city_weather/models/current_weather.dart';
import 'package:http/http.dart';

class CurrentWeatherApiProvider {
  Client client = Client();
  final baseUrl = "https://api.openweathermap.org";

  Future<CurrentWeather> getCurrentWeather(double latitude, double longitude) async {
    final response = await client.get("$baseUrl/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&appid=${ApiKey.apiKey}");
    if (response.statusCode == HttpStatus.ok) {
      return CurrentWeather.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load current weather");
    }
  }
}