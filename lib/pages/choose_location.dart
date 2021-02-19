import 'package:flutter/material.dart';
import '../pages/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Berlin', location: 'Tirane', flag: 'albania.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldTime(
        url: 'America/Mexico_City',
        location: 'Mexico_City',
        flag: 'mexico.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
  ];

  void updateTime(index) async {
    WorldTime location = locations[index];
    await location.getTime();

    //navigate to home
    Navigator.pop(context, {
      'location': location.location,
      'flag': location.flag,
      'time': location.time,
      'isDayTime': location.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                  child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              )),
            );
          },
        ));
  }
}
