

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  void getLocationData() async{

    var weatherData=await WeatherModel().getLocationWeather();
    print('hrllo $weatherData');
    Navigator.push(context,MaterialPageRoute(builder: (context){return LocationScreen(weatherData);}));
  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: SpinKitRotatingCircle(color: Colors.white,size: 100,),),
    );
  }
}
