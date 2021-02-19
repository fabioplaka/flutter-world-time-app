import 'package:flutter/material.dart';
import 'services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await timeInstance.getTime();
    // setState(() {
    //   time = timeInstance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': timeInstance.location,
      'flag': timeInstance.flag,
      'time': timeInstance.time,
      'isDayTime': timeInstance.isDayTime
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
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 80.0,
          ),
        ));
  }
}
