import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  // to select location
  String time;  // to get time
  String url;  // to get information of the location
  String flag;  // to select flag
 // String date;  // to get date
  bool isDayTime; // to select the image of day or night

  //WorldTime({this.location, this.flag, this.url, this.date});
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      //print(data['datetime']);
      //print(data['timezone']);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String o = data['utc_offset'].substring(4, 6);


      // print(datetime);
      // print(o);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(o)));

      //convert the now into string format
      //time = now.toString();


      // to see the daytime or the nighttime
      isDayTime = now.hour >6 && now.hour <18 ? true : false;

      // to get a proper format of time
      time = DateFormat.jm().format(now);


      // this was a demo of how to decode the json String or url into a format that can we work with using the jsonDecode
      /* Response response =  await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/
    }
    catch(e){
      print('caught exception: $e');
      time = 'could not get time data';
    }
  }
}

//WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata',date: '22-09-2020');
WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');