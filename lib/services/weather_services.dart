import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';


class WeatherServices{
  String baseUrl ='http://api.weatherapi.com/v1';
  String apiKey = 'f4a054deb6d048fb8e1143815231503';

  Future<WeatherModel> getweather({required String cityName})async{
    Uri url= Uri.parse('$baseUrl/forecast.json?key=$apiKey &q=$cityName&days=7');
   http.Response  response =await http.get(url);
   Map<String,dynamic>data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);


   return weather;
  }

}


