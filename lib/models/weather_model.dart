import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  //String weatherStateName;
  String date;
  double temp;
  double maxTemp;
  double minTemp;

  String weatherState;
  WeatherModel(
      {

        required this.date,
        required this.temp,
      required this.maxTemp,
      required this.minTemp,

      required this.weatherState});


  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(

        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherState: jsonData['condition']['text'],

    );
  }
@override
  String toString() {
    // TODO: implement toString
    return 'date $date      mintemp:$minTemp      maxtemp:$maxTemp';
  }

String getImage(){
    if (weatherState =='Clear'||weatherState =='Light Cloud'){
        return 'assets/images/clear.png';
    }
    else if (weatherState =='Sleet'||weatherState =='Snow'||weatherState =='Hail'){
      return 'assets/images/snow.png';
    }
    else if (weatherState =='Heavy Cloud'||weatherState=='Overcast'){
      return 'assets/images/cloudy.png';
    }
    else if (weatherState =='Light Rain'||weatherState =='Heavy Rain'||weatherState =='Patchy rain possible'){
      return 'assets/images/rainy.png';
    }
    else if (weatherState =='Thunderstorm'||weatherState =='Thunder'){
      return 'assets/images/thunderstorm.png';
    }
   else{
return'assets/images/clear.png';
    }
}


  MaterialColor getColor(){
    if (weatherState =='Clear'||weatherState =='Light Cloud'){
      return Colors.orange;
    }
    else if (weatherState =='Sleet'||weatherState =='Snow'||weatherState =='Hail'){
      return Colors.grey;
    }
    else if (weatherState =='Heavy Cloud'||weatherState=='Overcast'){
      return Colors.blueGrey;
    }
    else if (weatherState =='Light Rain'||weatherState =='Heavy Rain'||weatherState =='Patchy rain possible'){
      return Colors.lightBlue;
    }
    else if (weatherState =='Thunderstorm'||weatherState =='Thunder'){
      return Colors.yellow;
    }
    else{
      return Colors.orange;
    }
  }
  }







