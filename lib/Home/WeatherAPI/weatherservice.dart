import 'dart:convert';

import 'package:chatting/Home/WeatherAPI/weathermodel.dart';
import 'package:http/http.dart' as http;
class WeatherService {
  Future<Weather> getweather(String place) async {
    try {
      final query = {
        'key': '9e079147bcfe40a482c102432242801',
        'q': '$place',
        'aqi': 'yes',
      };
      final uri = Uri.http(
          'api.weatherapi.com', '/v1/current.json', query);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception("moye moye");
      }
    }
    catch(e){
      rethrow;
    }
  }
}