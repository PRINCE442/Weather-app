import 'package:climate_app/Screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_app/Services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initstate() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.red,
          duration: Duration(microseconds: 3000),
          size: 70.0,
        ),
      ),
    );
  }
}


//https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid= 9caf4d94385d65b8d8f390ee96e9f43d