import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // set the backgroung image
    String bgImage = data['isDayTime']? 'daytime.png' : 'Nighttime.png';
    Color bgColor = data['isDayTime']? Colors.blue : Colors.indigo;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0,0,0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                SizedBox(height: 100.0),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                       // 'date' : result['date'],
                        'isDayTime' : result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.add_location,
                      color: Colors.red
                  ),
                  label: Text(
                    'Select Loaction',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    data['location'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),


               /* SizedBox(height: 20.0),
                Text(
                  data['date'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                  ),
                ),*/


                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 60.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
