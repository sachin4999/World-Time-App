import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime () async {
    //WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata', date: '22-09-2020');
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      //'date': instance.date,
      'isDayTime': instance.isDayTime,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
