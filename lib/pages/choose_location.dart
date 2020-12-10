import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(url: 'Asia/Kolkata' ,location:'India' ,flag: 'india.png'),
    WorldTime(url: 'America/New_York' ,location: 'New York',flag: 'newyork.png'),
    WorldTime(url: 'Asia/Dubai' ,location: 'Dubai',flag: 'dubai.png'),
    WorldTime(url: 'Europe/London' ,location: 'London',flag: 'london.png'),
    WorldTime(url: 'Europe/Paris' ,location: 'Paris',flag: 'paris.png'),
    WorldTime(url: 'Indian/Maldives' ,location: 'Maldives' ,flag: 'maldives.png'),
    WorldTime(url: 'America/Los_Angeles' ,location: 'Los Angeles',flag: 'losangeles.png'),
    WorldTime(url: 'Australia/Sydney',location: 'Sydney',flag: 'australia.png'),

  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen and pop the old home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      //'date': instance.date,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
