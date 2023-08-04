import 'package:cima_2/screens/location_screen.dart';
import 'package:cima_2/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var networkData = await WeatherModel().getWeatherLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: networkData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
          SizedBox(
            height: 70.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              'Please wait',
              style: TextStyle(fontSize: 35.0),
            ),
            SizedBox(
              width: 10.0,
            ),

          ]),
        ],
      ),
    );
  }
}
