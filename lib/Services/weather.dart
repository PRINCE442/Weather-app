import '../Services/locations.dart';
import 'package:climate_app/Services/networking.dart';


const apiKey = '9caf4d94385d65b8d8f390ee96e9f43d';
const openWeathermapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{

    
    NetworkHelper networkHelper = NetworkHelper('$openWeathermapURL?q=$cityName&appid=$apiKey&units=metric');

    var wetherData = await networkHelper.getData();
    return wetherData;
  }


  Future<dynamic> getLocationWeather() async{

     Location location = Location();

    await location.getCurrentLocation();

    // longitude = location.longitude;
    // latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeathermapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;


  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}