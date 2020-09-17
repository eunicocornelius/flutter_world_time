import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  //   Response response =
  //       await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);

  //   // simulate network request for a username
  //   // String username = await Future.delayed(Duration(seconds: 3), () {
  //   //   return 'Yoshii';
  //   // });

  //   // simulate network request to get bio of username
  //   // String bio = await Future.delayed(Duration(seconds: 2), () {
  //   //   return 'vegan, musician, egg collector';
  //   // });

  //   // print('$username - $bio');
  // }

  // String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Jakarta',
      flag: 'jakarta.png',
      url: 'Asia/Jakarta',
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
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
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
