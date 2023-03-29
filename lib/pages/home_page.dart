import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Column(
              children: [
                Text(
                  'there is no data ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          : Center(
              child: Container(
                color: Colors.orangeAccent,
                child: Column(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text('Ubdated 12-8-2020'),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text('${weatherData!.temp.toInt()}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500)),
                        Column(
                          children: [
                            Text('maxTemp : ${weatherData!.maxTemp.toInt()} '),
                            Text('minTemp : ${weatherData!.maxTemp.toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(// 'clear',
                        weatherData!.weatherState,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500)),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
