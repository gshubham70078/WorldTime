import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import "package:http/http.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
  void setupWorldTime() async{
    WorldTime instance =WorldTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');



    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
   // Future.delayed(Duration(seconds: 3),(){

    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDay':instance.isDay,

    // });
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,


        ),
      ),
    );
  }
}
void ss(){

}