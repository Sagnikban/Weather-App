

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const Apikey='219f51d3697cdc381d7097a10394c559';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double latitude;
  double longitude;

     void  getlocationData() async {
    Location location=Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    /*print(latitude);
    print('kumro');
    print(longitude);
    print('potas');*/
    NetworkHelper networkhelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${Apikey}&units=metric');
    var weatherData=await networkhelper.getData();

   Navigator.push(context,MaterialPageRoute(builder: (context)
    {
      return LocationScreen(locationWeather: weatherData);
    }));

  }



  void initState() {
    // TODO: implement initState

    super.initState();
    getlocationData();
    print('This line of code is trigerred');

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
          child:SpinKitDoubleBounce(
            color:Colors.white,
            size:100.0,
          ),
      ),

    );
  }
}
