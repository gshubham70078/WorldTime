import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String im=data['isDay'] ? 'day.png':'night.png';
Color bgcolor=data['isDay'] ? Colors.blue:Colors.indigo;
    return Scaffold(
backgroundColor: bgcolor,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$im'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(

            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(onPressed: () async {
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location':result['location'],
                        'flag':result['flag'],
                        'time':result['time'],
                        'isDay':result['isDay']
                      };

                    });
                  }, icon: Icon(Icons.edit_location,color: Colors.grey[300],), label: Text(('Edit Location'),style: TextStyle(color: Colors.grey[300]),)),
                  SizedBox(height: 20.0,),
                  Row(
                    children:<Widget> [
                      CircleAvatar(

                        // backgroundImage: AssetImage('assets/images/${data['flag']}'),maxRadius: 15,

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(data['time'],
                      style: TextStyle(fontSize: 69.0,letterSpacing: 2.0,color: Colors.white)),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
