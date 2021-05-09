import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String time;
  String flag;
  String url;
bool isDay;
  WorldTime({this.location, this.flag, this.url});

 Future <void> getTime() async {
   try {
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map date = jsonDecode(response.body);
//print(data);
     String datetime = date['datetime'];
     String offset = date['utc_offset'].substring(1, 3);
     //print(datetime);
//  print(offset);
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     //print(now);
     isDay=now.hour>6 && now.hour<20 ? true :false;
     time = DateFormat.jm().format(now);


   }
   catch(e) {
     print('error: $e');
     time='not find!!!!!!!!!!!!!';
   }
   }
 }


