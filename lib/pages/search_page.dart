import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
String? cityName;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Search Your City'),


        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
               onSubmitted: (data)async{
                  cityName =data;

                 WeatherServices service = WeatherServices();
                 WeatherModel? weather =
                 await service.getweather(cityName: cityName!);
                 print(weather.temp);
                 Provider.of<WeatherProvider>(context,listen: false).weatherData= weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                 Navigator.pop(context);
               },




                decoration: InputDecoration(
                    hintText: ' search a city ',
                    labelText: 'search',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 30)
                ),
              ),
            )),
      );
  }
}
