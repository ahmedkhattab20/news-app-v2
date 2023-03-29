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
    if (weatherState =='Clear'||weatherState =='Sunny'){
        return 'assets/images/clear.png';
    }
    else if (weatherState =='Clear'||weatherState =='Thunder'){
      return 'assets/images/clear.png';
    }
    else if (weatherState =='Clear'||weatherState =='Thunder'){
      return 'assets/images/clear.png';
    }
    else if (weatherState =='Clear'||weatherState =='Thunder'){
      return 'assets/images/clear.png';
    }
    else if (weatherState =='Clear'||weatherState =='Thunder'){
      return 'assets/images/clear.png';
    }
   else{
return'assets/images/clear.png';
    }
}

  }







