import 'package:chatting/Home/FactAPICall/apicall.dart';
import 'package:chatting/Home/WeatherAPI/weathermodel.dart';
import 'package:chatting/Home/WeatherAPI/weatherservice.dart';
import 'package:flutter/material.dart';
class Homea extends StatefulWidget {
  const Homea({Key? key}) : super(key: key);

  @override
  State<Homea> createState() => _HomeaState();
}

class _HomeaState extends State<Homea> {

  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  String con="";
  double temp=0;
  int aqi=0;
  String ico="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getW();
  }

  void getW() async {
    weather = await weatherService.getweather("ghaziabad");
    setState(() {
      con=weather.condition;
      temp=weather.temperature;
      aqi=weather.aqi;
      ico=weather.icon;
    });
    print(weather.temperature);
    print(weather.condition);
    print(weather.aqi);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
            SizedBox(height: 20,),

            //Fact(),
            //this is for apicall
          ],
        ),
      ),
    );
  }
}
